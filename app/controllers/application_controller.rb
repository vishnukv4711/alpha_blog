class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    # debugger
    !!current_user
  end

  def require_user
    # debugger
    unless logged_in?
      flash[:alert] = "You need to be logged in for that action"
      redirect_to login_path
    end
  end

  def article_crud_authorization
    # debugger
    # unless Article.find(params[:id])[:user_id] == session[:user_id]
    unless current_user == @article.user || current_user.admin?
      flash[:alert] = "Only #{owner} can perform that action"
      redirect_to articles_path
    end
  end

  def user_crud_authorization
    unless current_user == @user
      flash[:alert] = "Only #{@user.username} can perform that action"
      redirect_to articles_path
    end
  end



  private

  def owner
    Article.find(params[:id]).user.username
  end

end
