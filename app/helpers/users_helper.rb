module UsersHelper
  def current_user
    if session[:user_id].present?
        User.find(session[:user_id])
    end
  end

  def logged?
    session[:user_id].present?
  end
end
