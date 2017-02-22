class Category < ApplicationRecord
	has_many :products, dependent: :destroy
	validate :discount_valid

	def discount_valid
		# if discount<0 || discount>100
		# 	errors.add(:discount,"el descuento debe estar entre 0 y 100")
		# end
		if discount.to_i > 100 || discount.to_i < 0
			errors.add(:discount, "El descuento debe ser un valor entre 0 y 100")
		end
	end

end
