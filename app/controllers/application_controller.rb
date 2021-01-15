class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper


  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
  end

  private

  def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

end
