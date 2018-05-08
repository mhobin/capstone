class ChildUser < ApplicationRecord
  has_secure_password
  # validates :username, presence: true, uniqueness: true
  # belongs_to :parent_user
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :requests, through: :carted_products
end
