class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def applications
  end
end
