class UsersController < ApplicationController


  def show
    # debugger
    @user = User.find(params[:id])
    @articles = @user.articles

  end

  def index
    @users = User.all
  end

  def new
    # debugger
    @user = User.new
  end



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
    # debugger
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