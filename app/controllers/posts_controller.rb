class PostsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to users_path
  end

  private

  def post_params
    params[:post].permit(:text)
  end

end
