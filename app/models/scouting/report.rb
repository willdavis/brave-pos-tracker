class Scouting::Report < ActiveRecord::Base
  attr_accessible :star_id
  
  belongs_to :user
  
  validates :star_id, :presence => true
end
