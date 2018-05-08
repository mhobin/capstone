class ParentUser < ApplicationRecord
  has_secure_password
  # validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :child_users
  has_many :carted_products
  has_many :orders, through: :carted_products
end
