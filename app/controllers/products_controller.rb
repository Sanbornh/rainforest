class ProductsController < ApplicationController

  before_filter :find_product, only: [:edit, :update, :destroy]
  before_filter :ensure_logged_in, only: [:edit, :create, :show, :update, :destroy]

  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)

  	if @product.save
  		redirect_to products_path
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @product.update_attributes(product_params)
  		redirect_to product_path(@product)
  	else 
  		render :edit
  	end
  end

  def destroy
  	@product.destroy
  	redirect_to products_path
  end

  private 
  def product_params
    enforce_correct_format
  	params.require(:product).permit(:name, :description, :price_in_cents)
  end

  def enforce_correct_format
    params[:product][:price_in_cents] = (params[:product][:price_in_cents].to_f * 100).to_i
  end

  def formatted_price
    sprintf "%.2f", (@product.price_in_cents * 0.01).round(2)
  end

  def find_product
    @product = Product.find(params[:id])
  end


  helper_method :formatted_price
end

















