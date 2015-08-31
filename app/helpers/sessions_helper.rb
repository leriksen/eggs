module SessionsHelper

  def save_session(user_id)
    session[:user] = user_id
  end

  def clear_session
    session.delete :user
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user])
  end

  def current_user?
    @current_user.present?
  end
end
