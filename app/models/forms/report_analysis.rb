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
    #Parse directional scan results
    parse_dscan_results unless raw_dscan_data.nil?
    
    #Parse probe results
    parse_probe_results unless raw_probe_data.nil?
    
    #check the validity of the Forms::ReportAnalysis object
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
    CSV.parse(raw_probe_data, options = { :col_sep => "\t" }) do |row|
      object_category = row[1]
      object_group = row[2]
      object_name = row[3]
      object_distance = row[5]
      
      analyze_control_tower(object_name, object_distance) if object_group.match(/Control Tower/) and object_distance.match(/AU/).nil?
    end
  end
  
  def analyze_moon(name, distance)
    puts "Moon detected!\tname:#{name}\tdistance:#{distance}\t"
  end
  
  def analyze_control_tower(name, distance)
    puts "Control Tower detected!\tname:#{name}\tdistance:#{distance}\t"
  end
  
  def parse_moons
    CSV.parse(raw_dscan_data, options = { :col_sep => "\t" }) do |row|
      if row[1].match(/\AMoon\Z/) and row[2].match(/AU/).nil?
        name = row[0]
        
        #convert from "X,YYY,ZZZ km" to XYYYZZZ
        distance = row[2].gsub(/[^0-9]/,'').to_i
        
        moons.push([name,distance])
      end
    end
  end
  
  def parse_control_towers
    CSV.parse(raw_probe_data, options = { :col_sep => "\t" }) do |row|
      group = row[2]    #groupName of the object
      distance = row[5] #distance to the object (relative to the ship in space)
      
      #Filter for Control Towers and disregard any objects over 1.0 AU away
      if group.match(/Control Tower/) and distance.match(/AU/).nil?
        control_tower_name = row[3]   #typeName of the object
        
        #convert the string "X,YYY,ZZZ km" to the integer XYYYZZZ
        distance = distance.gsub(/[^0-9]/,'').to_i
        
        #find the closest moon to the control tower
        for moon in moons
          moon_name = moon[0]
          moon_distance = moon[1]
          
          #compare the distance to each moon with the distance to the control tower (relative to the pilot)
          #if the control tower is within +/- 10km of a moon, then assign that moons id to the control tower
          if distance.between?(moon_distance-10000,moon_distance+10000)
            
            #query evedata.io for the moons celestial data and control tower typeId
            url_safe_moon_name = moon_name.gsub(/ /,'%20')
            url_safe_tower_name = control_tower_name.gsub(/ /,'%20')
            moon_result = JSON.parse(open("http://evedata.herokuapp.com/celestials?name=#{url_safe_moon_name}").read).first
            tower_result = JSON.parse(open("http://evedata.herokuapp.com/control_towers?name=#{url_safe_tower_name}").read).first
            
            control_tower_params = {}
            control_tower_params["moon_id"] = moon_result["id"]
            control_tower_params["moon_name"] = moon_result["name"]
            control_tower_params["solar_system_id"] = moon_result["solar_system_id"]
            control_tower_params["constellation_id"] = moon_result["constellation_id"]
            control_tower_params["region_id"] = moon_result["region_id"]
            
            control_tower_params["control_tower_type_id"] = tower_result["id"]
            control_tower_params["control_tower_type_name"] = tower_result["name"]
            
            control_towers.push(control_tower(control_tower_params))
          end
        end
      end
    end
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
  
  def control_tower(params)
    Scouting::ControlTower.where(:moon_id => params["moon_id"]).first_or_initialize(
      :control_tower_type_name => params["control_tower_type_name"],
      :control_tower_type_id => params["control_tower_type_id"],
      :moon_name => params["moon_name"],
      :region_id => params["region_id"],
      :constellation_id => params["constellation_id"],
      :solar_system_id => params["solar_system_id"],
    )
  end
end
