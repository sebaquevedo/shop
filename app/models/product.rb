class Product < ApplicationRecord
	belongs_to :category

	validates :price, presence: true, numericality: { only_integer: true }
	before_save :premium_default

	def premium_default
		self.premium ||= false
=begin		unless self.premium.present? or self.premium == true
			self.premium = false			
		end
=end	end
end
