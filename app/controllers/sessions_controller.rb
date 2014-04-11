class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_username(sessions_params[:username])
    if user && user.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in!"
      redirect_to root_path
    else
      flash[:alert] = "Username or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to root_path
  end

  private

  def sessions_params
    params.permit(:username, :password)
  end
end
