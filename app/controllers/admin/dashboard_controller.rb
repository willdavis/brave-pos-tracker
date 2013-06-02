class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def applications
    @users = User.joins('LEFT OUTER JOIN roles_users ON roles_users.user_id = users.id WHERE users.confirmed_at NOT NULL AND roles_users.role_id IS NULL')
    authorize! :manage, @users
  end
end
