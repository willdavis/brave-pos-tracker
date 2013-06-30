class Scouting::Report < ActiveRecord::Base
  attr_accessible :solar_system_id, :solar_system_name, :user_id, :raw_dscan_data, :raw_probe_data, :job_id
  attr_accessor :raw_dscan_data, :raw_probe_data
  
  belongs_to :user
  has_and_belongs_to_many :control_towers, :class_name => "Scouting::ControlTower"
  
  after_commit :queue_job, :on => :create
  
  def queue_job
    job_id = Scouting::ReportWorker.perform_async(id, raw_dscan_data, raw_probe_data)
  end
end
