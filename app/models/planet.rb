class Planet < ActiveRecord::Base
  attr_accessible :asteroid_belt_count, :name, :poco_owner_id
end
