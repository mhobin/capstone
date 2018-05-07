class Request < ApplicationRecord
  has_many :carted_products
  belongs_to :child_user
end
