class AddChildIdToCartedProd < ActiveRecord::Migration[5.1]
  def change
    add_column :carted_products, :child_user_id, :integer
  end
end
