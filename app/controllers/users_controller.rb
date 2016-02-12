class UsersController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
    if @user.nil?
      redirect_to signin_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
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
