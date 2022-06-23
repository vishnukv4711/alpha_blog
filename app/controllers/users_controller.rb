class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit]
  before_action :require_user, only: [:edit, :update]
  before_action :user_crud_authorization, only: [:edit, :update]


  def show
    # debugger
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 2)

  end

  def index
    @users = User.paginate(page: params[:page], per_page: 2)
    # @users = User.all
  end

  def new
    # debugger
    @user = User.new
  end



  def create
    # debugger
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the AlphaBlog #{@user.username}, you have successfully singed up.!!!!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end


  def edit
    # debugger
  end



  def update
    # debugger
    @user = User.find(params[:id])
    if @user.update(user_params)
      # debugger
      flash[:notice] = "USER INFO UPDATED SUCCESSFULLY"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end