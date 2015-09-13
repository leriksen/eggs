class SessionsController < ApplicationController
  
  def create
    user = User.find_by_email(params[:session][:email])
    if user and user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Successfully logged in"
      remember user
      redirect_to root_url
    else
      flash.now[:error] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    logger.debug "logging out - logged in ? #{logged_in?}"
    log_out if logged_in?
    flash[:success] = "Successfully logged out"
    redirect_to root_url
  end
end
