class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def create
    @category = Category.create(params[:category])
    respond_with(@category, :location => admin_categories_path)
  end

  def edit
    respond_with(@category)
  end

  def update
    @category.update_attributes(params[:category])
    respond_with(@category, :location => admin_categories_path)
  end

  def destroy
    @category.destroy
  end

  private
  before_filter :load_category, :only => [:edit, :update, :destroy]
  def load_category
    @category = Category.find(params[:id])
  end
end
