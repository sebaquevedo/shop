class Product < ApplicationRecord
	belongs_to :category

	scope :premium_search, ->{ where(premium: true)}
	scope :last_n, ->(cant) {order('id DESC').limit(cant)}

	validates :price, presence: true, numericality: { only_integer: true }
	before_save :premium_default

	def premium_default
		self.premium ||= false
	end
end
