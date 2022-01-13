class CategoriesController < ApplicationController
  def index
    @categories = Categories.order(id: :desc).all
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end
  
  def new
    @category = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end

 

end
