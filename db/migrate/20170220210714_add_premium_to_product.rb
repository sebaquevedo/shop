class AddPremiumToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :premium, :boolean
  end
end
