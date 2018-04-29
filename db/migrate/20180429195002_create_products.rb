class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :sku
      t.string :name
      t.string :class
      t.string :department
      t.text :longDescription
      t.text :shortDescription
      t.boolean :onSale
      t.decimal :shippingCost
      t.decimal :regularPrice
      t.decimal :salePrice
      t.string :image
      t.string :color
      t.boolean :preowned

      t.timestamps
    end
  end
end
