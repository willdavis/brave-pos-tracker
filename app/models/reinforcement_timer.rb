class ReinforcementTimer < ActiveRecord::Base
  attr_accessible :expires_at, :control_tower_id
  
  belongs_to :control_tower
  validates :control_tower_id, :presence => true
  
  def expired?
    Time.now > expires_at
  end
end
