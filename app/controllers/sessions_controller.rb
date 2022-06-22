class SessionsController < ApplicationController

  def new

  end

  def create
    # debugger
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "You are logged in as #{user.username}"
      redirect_to articles_path
    else
      flash.now[:notice] = "Incorrect username or password"
      render 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "YOU ARE SUCCESSFULLY LOGGED OUT!!!!!!!"
    redirect_to root_path
  end

end