class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  # before_action :require_user, :article_crud_authorization, except: [:show,:index]        my code## reason:- require_user is called first except for "index" and "show" which should
  #                                                                                              be accessible for any user. So a non logged user should have access to these
  #                                                                                              2 only. And even if a new person is logged in they should have access only to
  #                                                                                              "new" and "create" . "Edit", "update" and "destroy" are om;y for the person who
  #                                                                                              created that article and that check is done by intended_user. my code is correct
  #                                                                                              but checking "new" and "create" is an unnecessary step.
  before_action :require_user, except: [:show,:index]
  before_action :article_crud_authorization, only: [:edit, :update, :destroy]

  def show
  end

  def index
    # debugger
    # @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 4)
  end


  def new
    @article = Article.new
  end

  def edit
    # debugger
  end

  def create
    # debugger
    @article = Article.new(article_params)
    @article.user = User.find(session[:user_id])                              #wrong comment#  #bcz currently articles/new has no user col and without user article creation throws an error.

    # @article = Article.new
    # @article.title = params[:article][:title]
    # @article.description = params[:article][:description]
    if @article.save
      flash[:notice] = "Article was created succesfully!!!!!"
      redirect_to @article
    else
      render 'articles/new'
    end
  end

  def update
    # @article.title = params[:article][:title]
    # @article.description = params[:article][:description]
    # if @article.save
    #  debugger
     if @article.update(article_params)
      flash[:notice] = "Article is edited succesfully!!!!!!!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    # debugger
    flash[:notce] = "Successfully deleted element at index - #{params[:id]}"
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids:[])
  end



end