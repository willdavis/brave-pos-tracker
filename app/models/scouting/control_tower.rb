require 'open-uri'

class Scouting::ControlTower < ActiveRecord::Base
  attr_accessible :control_tower_type_id,  :control_tower_type_name, :moon_id, :moon_name, 
    :region_id, :solar_system_id, :constellation_id, :corporation_id, :structure_ids
  attr_accessor :distance
  
    has_and_belongs_to_many :reports, :class_name => "Scouting::Report"
    
    def structures
      return [] if structure_ids.nil?
      structure_ids.split(',').map { |s| s.to_i }
    end
    
    def corporation
      @corporation ||= Corporation.new(corporation_id)
    end
end
