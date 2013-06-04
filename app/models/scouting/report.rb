class Scouting::Report < ActiveRecord::Base
  attr_accessible :planet_ids, :star_id
  
  validates :star_id, :presence => true
  
  def star
    Star.find(star_id)
  end
end
