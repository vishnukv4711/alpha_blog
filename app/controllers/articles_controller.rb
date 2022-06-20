class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]


  def show
  end

  def index
    # debugger
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    # debugger
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first

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
     debugger
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
    params.require(:article).permit(:title, :description)
  end



end