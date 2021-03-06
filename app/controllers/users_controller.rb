class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "New user added."
      redirect_to root_path
    else
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :role)
  end
end
