class Scouting::ControlTower < ActiveRecord::Base
  attr_accessible :control_tower_type_id,  :control_tower_type_name, :moon_id, :moon_name, 
    :region_id, :solar_system_id, :constellation_id
  
    has_and_belongs_to_many :reports, :class_name => "Scouting::Report"
end
