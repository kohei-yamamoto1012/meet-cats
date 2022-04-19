class UserSessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: user_session_params[:email])

    if user&.authenticate(user_session_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, success: 'ログインしました'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to users_path, success: 'ログアウトしました'
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end

end
