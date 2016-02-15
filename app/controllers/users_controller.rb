class UsersController < ApplicationController

  def index
    if !signed_in?
      redirect_to signin_path
    end
  end

  def reply
    if !signed_in?
      redirect_to signin_path
    end
    @reply_posts = Post.find(:all, :conditions => { :in_replay_to_user_id => current_user.id }, :order => "created_at DESC")
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
