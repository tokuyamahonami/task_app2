class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile, :show]

  def show
    @user = current_user
  end

  def profile_edit
    @user = User.find(params[:id])
  end

  def profile
    @user = current_user
    @user = User.new(user_params)
    if @user.update(params.permit(:name, :introduction, :image))
      flash[:notice] = "Profile was successfully updated."
      redirect_to users_edit_path
    #else
      #render :edit
    end
  end

  private
  def user_params
    params.permit(:name, :email, :password, :image)
  end

end
