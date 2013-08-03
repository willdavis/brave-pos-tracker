class ControlTower < ActiveRecord::Base
  attr_accessible :constellation_id, :corporation_id, :moon_id, :moon_name, :region_id, :solar_system_id, :type_id
  
  belongs_to :corporation
end
