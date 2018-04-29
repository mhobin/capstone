class RemoveOnSaleFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :onSale, :boolean
  end
end
