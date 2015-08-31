module SessionsHelper

  def save_session(user)
    session[:user] = user
  end

  def clear_session
    session[:user] = nil
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user])
  end

  def current_user?
    @current_user.present?
  end
end
