class ChildUser < ApplicationRecord
  belongs_to :parent_user
  has_many :carted_products
  has_many :orders, through: :carted_products
end
