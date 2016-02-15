class PostsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    text = post_params
    replyUserId = getReplyId(text[:text])
    @post = @user.posts.create(in_reply_to_user_id: replyUserId, text: text[:text])
    redirect_to users_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to users_path
  end

  private

  def post_params
    params[:post].permit(:text)
  end

  def getReplyId(text)
    at = text.match(/@(\w+) /)
    if !at.nil?
      getUserIdByScreenName(at[1])
    else
      nil
    end
  end

  def getUserIdByScreenName(screenName)
    at_user = User.find_by(screen_name: screenName)
    if !at_user.nil?
      at_user.id
    else
      nil
    end
  end

end
