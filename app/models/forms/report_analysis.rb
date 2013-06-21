require 'open-uri'
require 'json'
require 'csv'

class Forms::ReportAnalysis
  # ActiveModel plumbing to make `form_for` work
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  # ActiveModel support
  def persisted?; false; end
  
  ATTRIBUTES = [:user_id, :solar_system_id, :solar_system_name, :raw_dscan_data, :raw_probe_data]
  attr_accessor *ATTRIBUTES

  validates :user_id,           :presence => true
  validates :solar_system_id,   :presence => true
  validates :solar_system_name, :presence => true
  validates :raw_dscan_data,    :presence => true
  validates :raw_probe_data,    :presence => true
  
  validate do
    [user, report].each do |object|
      unless object.valid?
        object.errors.each do |key, values|
          errors[key] = values
        end
      end
    end
    
    control_towers.each do |object|
      unless object.valid?
        object.errors.each do |key, values|
          errors[key] = values
        end
      end
    end
  end
  
  def user
    @user ||= User.find(user_id)
  end
  
  def report
    @report ||= Scouting::Report.new(:solar_system_id => solar_system_id, :solar_system_name => solar_system_name)
  end
  
  def control_towers
    @control_towers ||= []
  end
  
  def moons
    @moons ||= []
  end
  
  def initialize(attributes = {})
    ATTRIBUTES.each do |attribute|
      send("#{attribute}=", attributes[attribute])
    end
  end
  
  def save
    #check the validity of the Forms::ReportAnalysis object
    return false unless valid?
    
    #Parse directional scan results
    parse_dscan_results unless raw_dscan_data.nil?
    
    #Parse probe results
    parse_probe_results unless raw_probe_data.nil?
    
    #check the validity of any newly created towers
    return false unless valid?
    
    #Save the analyzed objects
    if create_objects
      user.scouting_reports << report
      control_towers.each do |tower|
        report.control_towers << tower
      end
    else
      false
    end
  end
  
  private
  
  def parse_dscan_results
    CSV.parse(raw_dscan_data, options = { :col_sep => "\t" }) do |row|
      object_name = row[0]
      object_group = row[1]
      object_distance = row[2]
      
      analyze_moon(object_name, object_distance) if object_group.match(/\AMoon\Z/) and object_distance.match(/AU/).nil?
    end
  end
  
  def parse_probe_results
    towers = []
    structures = []
    CSV.parse(raw_probe_data, options = { :col_sep => "\t" }) do |row|
      object_category = row[1]
      object_group = row[2]
      object_name = row[3]
      object_distance = row[5]
      
      towers.push(analyze_control_tower(object_name, object_distance)) if object_group.match(/Control Tower/) and object_distance.match(/AU/).nil?
      structures.push(analyze_structure(object_name, object_distance)) if object_category.match(/Structure/) and object_group.match(/Control Tower/).nil? and object_distance.match(/AU/).nil?
    end
    
    #build control towers
    towers.each do |tower|
      moons.each do |moon|
        if tower["distance"].between?(moon["distance"]-10000,moon["distance"]+10000)
          tower["moon_id"] = moon["id"]
          control_towers.push(build_control_tower(tower, moon))
        end
      end
    end
    
    #attach structures to control towers
    structures.each do |structure|
      towers.each do |tower|
        if structure["distance"].between?(tower["distance"]-1000,tower["distance"]+1000) and !tower["moon_id"].nil?
          control_tower = control_towers.select{ |tower| tower.moon_id == tower["moon_id"] }.first
          control_tower.structure_ids.nil? ? control_tower.structure_ids = structure["id"].to_s : control_tower.structure_ids << ",#{structure["id"]}"
        end
      end
    end
  end
  
  def analyze_moon(name, distance)
    puts "Moon detected!"
    
    #convert from "X,YYY,ZZZ km" to XYYYZZZ
    number = distance.gsub(/[^0-9]/,'').to_i
    
    url_safe_moon_name = name.gsub(/ /,'%20')
    moon = JSON.parse(open("http://evedata.herokuapp.com/celestials?name=#{url_safe_moon_name}").read).first
    moon["distance"] = number
    
    puts moon
    moons.push(moon)
  end
  
  def analyze_control_tower(name, distance)
    puts "Control Tower detected!"
    
    #convert from "X,YYY,ZZZ km" to XYYYZZZ
    number = distance.gsub(/[^0-9]/,'').to_i
    
    url_safe_tower_name = name.gsub(/ /,'%20')
    tower = JSON.parse(open("http://evedata.herokuapp.com/control_towers?name=#{url_safe_tower_name}").read).first
    tower["distance"] = number
    
    puts tower
    tower
  end
  
  def analyze_structure(name, distance)
    puts "Structure detected!"
    
    #convert from "X,YYY,ZZZ km" to XYYYZZZ
    number = distance.gsub(/[^0-9]/,'').to_i
    
    url_safe_name = name.gsub(/ /,'%20')
    structure = JSON.parse(open("http://evedata.herokuapp.com/structures?name=#{url_safe_name}").read).first
    structure["distance"] = number
    
    puts structure
    structure
  end

  def create_objects
    ActiveRecord::Base.transaction do
      report.save!
      control_towers.each do |tower|
        tower.save!
      end
    end
  rescue
    false
  end
  
  def build_control_tower(tower, moon)
    Scouting::ControlTower.where(:moon_id => moon["id"]).first_or_initialize(
      :control_tower_type_name => tower["name"],
      :control_tower_type_id => tower["id"],
      :moon_name => moon["name"],
      :region_id => moon["region_id"],
      :constellation_id => moon["constellation_id"],
      :solar_system_id => moon["solar_system_id"],
    )
  end
end
