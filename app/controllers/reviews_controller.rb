class ReviewsController < ApplicationController

	before_filter :load_product

  def show
  	@review = Review.find(params[:id])
  end

  def new
  	@review = @product.reviews.build(review_params)
  	@review.user_id = current_user.id

  	if @review.save
  		redirect_to products_path, notice: "Review created successfully"
  	else
  		render :action => :show
  	end
  end

  def edit
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end

  private
  def review_params

  end

  def load_product
  	@product = Product.find(params[:product_id])
  end
end
