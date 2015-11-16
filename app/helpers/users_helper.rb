module UsersHelper
  def current_user
    if session[:user_id] != nil
    @user ||= User.find(session[:user_id])
    end
  end

end
