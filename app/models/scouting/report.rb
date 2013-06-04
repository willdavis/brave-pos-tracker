class Scouting::Report < ActiveRecord::Base
  attr_accessible :planet_ids, :star_id
  
  belongs_to :user
  
  validates :star_id, :presence => true
  
  def star
    Star.find(star_id)
  end
  
  def planets
    planet_ids.split(',').map { |id| id.to_i }
  end
end
