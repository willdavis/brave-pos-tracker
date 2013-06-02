class Star < ActiveRecord::Base
  attr_accessible :gate_count, :name, :security
  
  validates :name, :presence => true, :uniqueness => true
  validates :security, :presence => true
  validates :gate_count, :presence => true
end
