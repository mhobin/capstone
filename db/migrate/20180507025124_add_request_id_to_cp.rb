class AddRequestIdToCp < ActiveRecord::Migration[5.1]
  def change
    add_column :carted_products, :request_id, :integer
  end
end
