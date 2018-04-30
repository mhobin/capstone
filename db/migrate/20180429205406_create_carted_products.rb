class CreateCartedProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :carted_products do |t|
      t.integer :parent_user_id
      t.string :child_user_id
      t.string :status
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
