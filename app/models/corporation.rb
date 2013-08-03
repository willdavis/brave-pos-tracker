class Corporation < ActiveRecord::Base
  attr_accessible :eve_id, :name
  
  has_many :control_towers
end
