class CategoriesController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
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

end