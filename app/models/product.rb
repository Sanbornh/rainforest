class Product < ActiveRecord::Base
	validates :description, :name, :presence => true
	# validates :price_in_cents, :numericality => {:only_float => true}

	def formatted_price
		sprintf "%.2f", (@product.price_in_cents * 0.01).round(2)
	end
end
