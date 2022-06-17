class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    debugger
    @user = User.new(params.require(:user).permit(:username,:email))
    if @user.save
      flash[:notice] = "The user got created"
      redirect_to users_path
    end
  end

end