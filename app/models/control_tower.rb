class ControlTower < ActiveRecord::Base
  attr_accessible :constellation_id, :corporation_id, :moon_id, :moon_name, :region_id, :solar_system_id, :type_id
  
  belongs_to :corporation
  has_one :reinforcement_timer, :dependent => :destroy
  
  validates :corporation_id,  :presence => true
  validates :moon_id,         :presence => true,  :numericality => true,  :uniqueness => true
  validates :type_id,         :presence => true,  :numericality => true
end
