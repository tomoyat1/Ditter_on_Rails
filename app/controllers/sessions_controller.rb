class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && authenticate(user)
      sign_in user
      redirect_to users_path
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def authenticate(user)
    if user.password === params[:session][:password]
      return true
    else
      return false
    end
  end

end
