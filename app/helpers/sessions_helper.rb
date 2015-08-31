module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user])
  end
end
