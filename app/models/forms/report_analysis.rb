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
  end
  
  def user
    @user ||= User.find(user_id)
  end
  
  def report
    @report ||= Scouting::Report.new(
      :solar_system_id => solar_system_id, 
      :solar_system_name => solar_system_name,
      :raw_dscan_data => raw_dscan_data,
      :raw_probe_data => raw_probe_data
    )
  end
  
  def initialize(attributes = {})
    ATTRIBUTES.each do |attribute|
      send("#{attribute}=", attributes[attribute])
    end
  end
  
  def save
    #check the validity of the Forms::ReportAnalysis object
    return false unless valid?
    
    #Save the report
    if create_objects
      user.scouting_reports << report
    else
      false
    end
  end
  
  private
  
  def create_objects
    ActiveRecord::Base.transaction do
      report.save!
    end
  rescue
    false
  end
end
