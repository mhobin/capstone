class CreateChildUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :child_users do |t|
      t.string :username
      t.string :password_digest
      t.integer :parent_user_id

      t.timestamps
    end
  end
end
