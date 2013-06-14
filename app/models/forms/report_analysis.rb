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
    #analyze probe and dscan data for control towers
    results = JSON.parse(open("http://evedata.herokuapp.com/control_towers").read)
    puts results
    
    CSV.parse(raw_probe_data, options = { :col_sep => "\t" }) do |row|
      control_towers.push(new_control_tower(row[3])) if row[2].match(/Control Tower/)
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
  
  def new_control_tower(name)
    Scouting::ControlTower.new(:control_tower_type_name => name)
  end
end
