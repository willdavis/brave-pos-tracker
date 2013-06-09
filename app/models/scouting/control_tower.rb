class Scouting::ControlTower < ActiveRecord::Base
  attr_accessible :constellation_id, :control_tower_type_id, :moon_id, :region_id, :solar_system_id
  
    has_and_belongs_to_many :reports, :class_name => "Scouting::Report"
    
    validates :region_id,             :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1 }
    validates :constellation_id,      :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1 }
    validates :solar_system_id,       :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1 }
    validates :moon_id,               :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1 }
    validates :control_tower_type_id, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1 }
end
