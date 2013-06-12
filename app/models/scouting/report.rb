class Scouting::Report < ActiveRecord::Base
  attr_accessible :solar_system_id, :solar_system_name
  
  belongs_to :user
  has_and_belongs_to_many :control_towers, :class_name => "Scouting::ControlTower"
  
  validates :solar_system_id,   :presence => true
  validates :solar_system_name, :presence => true
end
