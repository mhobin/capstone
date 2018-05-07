class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :parent_user_id
      t.integer :child_user_id
      t.decimal :subtotal
      t.decimal :shipping
      t.decimal :tax
      t.decimal :total
      t.integer :quantity
      t.integer :product_id
      t.string :status

      t.timestamps
    end
  end
end
