class Product < ApplicationRecord
	belongs_to :category


	scope :premium_search, ->{ where(premium: true)}
	scope :last_n, ->(cant) {order('id DESC').limit(cant)}

	validates :price, presence: true, numericality: { only_integer: true }
	before_save :premium_default

	after_destroy :category_delete

	def premium_default
		self.premium ||= false
	end

	def category_delete
		c = Category.all
		c.each do |elem|
			if elem.products.empty? 
				elem.destroy
			end
		end
	end

	def precio_final 
		(self.price*self.category.discount)/100
	end



end
