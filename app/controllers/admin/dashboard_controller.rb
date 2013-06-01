class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def applications
    @users = User.where("role = 'unverified' AND confirmed_at NOT NULL")
  end
end
