class Planet < ActiveRecord::Base
  attr_accessible :asteroid_belt_count, :name, :poco_owner_id, :star_id
  
  validates :name, :presence => true, :uniqueness => true
  validates :asteroid_belt_count, :presence => true
  validates :ice_belt_count, :presence => true
  
  belongs_to :star
end
