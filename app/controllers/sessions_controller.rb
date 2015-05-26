class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    user.save!
    session[:user_id] = user.id
    redirect_to '/'
  end

  def destroy
    session[:user_id] = nil
    redirect_to :back, notice: "Signed out!"
  end

end