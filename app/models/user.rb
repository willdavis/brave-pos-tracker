class User < ActiveRecord::Base
  has_and_belongs_to_many :roles, :class_name => "Admin::Role"
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :confirmed_at, :pilot_name
  # attr_accessible :title, :body
  
  validates :pilot_name, :presence => true, :uniqueness => true
  
  has_many :scouting_reports, :class_name => "Scouting::Report"
  
  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end
end
