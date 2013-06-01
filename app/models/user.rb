class User < ActiveRecord::Base
  ROLES = %w[admin scout unverified banned]
  has_and_belongs_to_many :roles
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :confirmed_at, :pilot_name, :role
  # attr_accessible :title, :body
  
  validates :pilot_name, :presence => true, :uniqueness => true
  validates :role , :inclusion => { :in => User::ROLES, :message => "%{value} is not valid." }
end
