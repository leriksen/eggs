class SessionsController < ApplicationController  
  skip_before_action :require_login, only: [:new, :create]

  def create
    user = User.find_by_email(params[:session][:email])
    if user and user.active == false
      flash.now[:error] = "User is marked inactive, and cannot log in"
      render :new
    elsif user and user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Successfully logged in"
      params[:session][:remember_me] == '1' ?
        remember(user) :
        forget(user)
      redirect_to root_url
    else
      flash.now[:error] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Successfully logged out"
    redirect_to root_url
  end
end
