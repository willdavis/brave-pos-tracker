class Scouting::Report < ActiveRecord::Base
  attr_accessible :star_id
  
  belongs_to :user
  has_and_belongs_to_many :control_towers, :class_name => "Scouting::ControlTower"
  
  validates :star_id, :presence => true
end
