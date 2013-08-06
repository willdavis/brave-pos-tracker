class ReinforcementTimer < ActiveRecord::Base
  attr_accessible :expires_at, :control_tower_id
  
  belongs_to :control_tower
  validates :control_tower_id, :presence => true
  
  def countdown
    time = expires_at - Time.now
    Time.at(time).utc.strftime("%d:%I:%M:%S")
  end
end
