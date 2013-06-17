class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def applications
    authorize! :manage, @users
    @users = User.includes(:roles).where("confirmed_at NOT ? AND roles_users.role_id IS ?", nil, nil)
  end
  
  def accept_application
    @user = User.find(params[:user_id])
    @role = Admin::Role.find(params[:role_id])
    
    @user.roles << @role

    respond_to do |format|
      if @user.save
        format.html { redirect_to :back, notice: 'User roles have been successfully updated' }
        format.json { head :no_content }
      else
        format.html { redirect_to :back }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
