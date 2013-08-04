class Corporation < ActiveRecord::Base
  attr_accessible :eve_id, :name
  has_many :control_towers
  
  validates :name,    :presence => true
  validates :eve_id,  :presence => true
end
