class AddQuantityToPurchases < ActiveRecord::Migration[6.1]
  def change
    add_column :purchases, :quantity, :integer
  end
end
