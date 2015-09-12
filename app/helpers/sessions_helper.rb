module SessionsHelper

  def log_in(user)
    logger.debug "in SessionsHelper::log_in - user.id == #{user.id}"
    session[:user_id] = user.id
    current_user
  end

  def clear_session
    logger.debug "in SessionsHelper::clear_session"
    session.delete :user
    @current_user = nil
  end

  def current_user
    logger.debug "in SessionsHelper::current_user"
    if (user_id = session[:user_id])
      logger.debug "we have a user id from the sessionuser_id==#{user_id.inspect}"
      @current_user ||= User.find_by(id: user_id)
      logger.debug "@current_user==#{@current_user.inspect}"
    elsif (user_id = cookies.signed[:user_id])
      logger.debug "we have a signed cookie"
      user = User.find_by(id: user_id)
      logger.debug "user==#{user.inspect}"
      logger.debug "cookies[:remember_token]==#{cookies[:remember_token].inspect}"
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
      end
    else
      logger.debug "no session and no cookies for user"
    end
    logger.debug "@current_user==#{@current_user.inspect}"
    logger.debug "self.class==#{self.class.inspect}"

    @current_user
  end

  def current_user?
    logger.debug "In SessionsHelper::current_user? - someone is asking if there is already a current user"
    logger.debug "self.class==#{self.class.inspect}"
    logger.debug "@current_user==#{@current_user.inspect}"
    @current_user.present?
  end

  def remember(user)
    logger.debug "in SessionsHelper::remember user==#{user.inspect}"
    user.remember
    logger.debug "saving cookies for user ==#{user.inspect}"
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
end
