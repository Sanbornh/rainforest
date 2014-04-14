class Product < ActiveRecord::Base
	before_create :correct_price_format
	before_save :correct_price_format

	def correct_price_format
		self.price_in_cents = (self.price_in_cents.to_f * 100).to_i
	end
end
