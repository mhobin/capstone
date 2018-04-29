class RemoveClassFromProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :class, :string
  end
end
