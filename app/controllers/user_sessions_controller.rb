class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  def new; end

  def create
    @user = login(params[:email],params[:password])
    if @user
        redirect_back_or_to root_path, notice: 'Logged in!'
    else
        flash.now[:alert] = 'Login failed!'
        render :new
    end
  end
    
  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end
end
