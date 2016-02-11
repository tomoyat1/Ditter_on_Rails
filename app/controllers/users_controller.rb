class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params[:user].permit(:user_name, :screen_name, :email, :password, :comment)
  end

end
