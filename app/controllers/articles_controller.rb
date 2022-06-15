class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    # debugger
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
     debugger
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
    debugger
    @article = Article.find(params[:id])
    # @article.title = params[:article][:title]
    # @article.description = params[:article][:description]
    # if @article.save
     if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article is edited succesfully!!!!!!!"
      redirect_to @article
    else
      render 'edit'
    end
  end

end