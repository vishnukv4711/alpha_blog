class UsersController < ApplicationController

  def new
    # debugger
    @user = User.new
  end
  # debugger
  def create
    # debugger
    @user = User.new(params.require(:user).permit(:username, :email, :password))
    if @user.save
      flash[:notice] = "Welcome to the AlphaBlog #{@user.username}, you have successfully singed up.!!!!"
      redirect_to articles_path
    else
      render 'new'
    end
  end


  def edit
    debugger
    @user = User.find(params[:id])
  end

  def update
    # debugger
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:username, :email, :password))
      flash[:notice] = "USER INFO UPDATED SUCCESSFULLY"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

end