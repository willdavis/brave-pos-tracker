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
  
  def initialize(attributes = {})
    ATTRIBUTES.each do |attribute|
      send("#{attribute}=", attributes[attribute])
    end
  end
  
  def save
    #Parse directional scan results
    moons = []
    CSV.parse(raw_dscan_data, options = { :col_sep => "\t" }) do |row|
      if row[1].match(/Moon/) and row[2].match(/AU/).nil?
        name = row[0]
        
        #convert from "X,YYY,ZZZ km" to XYYYZZZ
        distance = row[2].gsub(/[^0-9]/,'').to_i
        
        moons.push([name,distance])
      end
    end
    
    #Parse probe results
    CSV.parse(raw_probe_data, options = { :col_sep => "\t" }) do |row|
      group = row[2]
      distance = row[5]
      
      if group.match(/Control Tower/) and distance.match(/AU/).nil?
        control_tower_name = row[3]
        
        #convert from "X,YYY,ZZZ km" to XYYYZZZ
        distance = distance.gsub(/[^0-9]/,'').to_i
        
        #find the closest moon
        for moon in moons
          moon_name = moon[0]
          moon_distance = moon[1]
          
          if distance.between?(moon_distance-10000,moon_distance+10000)
            
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
            
            control_towers.push(new_control_tower(control_tower_params))
          end
        end
      end
    end
    
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
  
  def new_control_tower(params)
    Scouting::ControlTower.new(
      :control_tower_type_name => params["control_tower_type_name"],
      :control_tower_type_id => params["control_tower_type_id"],
      :moon_name => params["moon_name"],
      :moon_id => params["moon_id"],
      :region_id => params["region_id"],
      :constellation_id => params["constellation_id"],
      :solar_system_id => params["solar_system_id"],
      )
  end
end
