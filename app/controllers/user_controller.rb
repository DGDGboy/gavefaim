class UserController < ApplicationController

before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def update
    @user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :gender, :password, :photos)
  end

  def set_restaurant
    @user = User.find(params[:id])
  end

end
