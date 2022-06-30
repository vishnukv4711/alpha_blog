class CategoriesController < ApplicationController
  before_action :set_category, only: [:show,:edit, :update]
  before_action :require_user, except: [:index, :show]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def show
    # debugger
    @articles = @category.articles.paginate(page: params[:page], per_page: 2)
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category updated successfully"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "The category was created successfully"
      redirect_to category_path(@category)
    else
      render 'categories/new'
    end
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_user
    unless logged_in? && current_user.admin?
      flash[:alert] = "Only admin can perform that action"
      redirect_to categories_path
    end
  end

  def set_category
    @category = Category.find(params[:id])
  end


end