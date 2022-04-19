class UsersController < ApplicationController
before_action :set_user, only: %i(show edit update destroy)

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user), success: 'ユーザー登録完了。'
    else
      render :new
    end
  end

  def update

    if @user.update(user_params)
      redirect_to user_path(@user), success: 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, success: 'ユーザーを削除しました。'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
