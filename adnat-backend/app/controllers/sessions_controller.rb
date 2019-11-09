class SessionsController < ApplicationController
  def new
    user = User.find_by email: params[:email]
    if user && user.authenticate(user[:id],params[:password])
      session[:id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end
  def create
    byebug
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end
  def destroy
    session[:id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end