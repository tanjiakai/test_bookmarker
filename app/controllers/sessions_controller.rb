class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    @user = user.authenticate(params[:session][:password])
    if @user
      session[:user_id] = @user.id
      redirect_to bookmarks_path
    else

      render 'sessions/new'
    end
  end
end
