class Scouting::Report < ActiveRecord::Base
  attr_accessible :star_id, :star_name
  
  belongs_to :user
  has_and_belongs_to_many :control_towers, :class_name => "Scouting::ControlTower"
  
  validates :star_id, :presence => true
  
  def star_name
    @star_name
  end
  
  def star_name=(val)
    @star_name = val
  end
end
