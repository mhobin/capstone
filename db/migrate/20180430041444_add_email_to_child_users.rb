class AddEmailToChildUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :child_users, :email, :string
  end
end
