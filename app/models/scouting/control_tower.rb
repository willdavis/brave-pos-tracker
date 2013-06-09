class Scouting::ControlTower < ActiveRecord::Base
  attr_accessible :constellation_id, :control_tower_type_id, :moon_id, :region_id, :solar_system_id
end
