class Order < ApplicationRecord
  has_many :carted_products
  belongs_to :parent_user
  belongs_to :child_user
end
