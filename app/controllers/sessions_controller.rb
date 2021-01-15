class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: user_params[:name])
    return head(:forbidden) unless user.authenticate(user_params[:password])
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def destroy
    session.delete :user_id
    redirect_to :root
  end

 

end
