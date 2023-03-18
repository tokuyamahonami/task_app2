class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile, :show]

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    #binding.pry
    if @user.update(params.require(:user).permit(:name, :introduction, :image))
      flash[:notice] = "ユーザーの情報を更新しました"
      redirect_to users_profile_path
    else
      render :edit
    end
  end

  def profile
    @user = current_user
  end

  private
  def user_params
    params.permit(:name, :email, :password, :image)
  end

end
