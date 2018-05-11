class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:alert] = "Log in succesful"
      redirect_to '/'
    else
      flash[:alert] = "Email or password is incorrect"
      redirect_to '/sign_in'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = "User signed out"
    redirect_to '/sign_in'
  end

end
