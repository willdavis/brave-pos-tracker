class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def applications
    @users = User.where("confirmed_at NOT NULL")
  end
end
