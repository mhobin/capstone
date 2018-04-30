class ChangeChildUserIdInteger < ActiveRecord::Migration[5.1]
  def change
    remove_column :carted_products, :child_user_id, :string
  end
end
