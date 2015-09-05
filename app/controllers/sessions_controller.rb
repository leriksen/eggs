class SessionsController < ApplicationController
  helper SessionsHelper
  
  def create
    user = User.find_by_email(params[:session][:email])
    if user and user.authenticate(params[:session][:password])
      save_session user.id
      flash[:success] = "Successfully logged in"
      redirect_to root_url
    else
      flash[:error] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    clear_session
    flash[:success] = "Successfully logged out"
    redirect_to root_url
  end
end
