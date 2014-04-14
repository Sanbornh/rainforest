class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
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
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])

    # Problem seems to be happening when
    # the new attributes are added to the table
    # because they are getting converted to an int
    # and the decimals are getting truncated
    # To fix, method needs to get called before attributes
    # are stored saved to the table.
  	if @product.update_attributes(product_params)

  		redirect_to products_path
  	else 
  		render :edit
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_path
  end

  private 
  def product_params
  	params.require(:product).permit(:name, :description, :price_in_cents)
  end

end
