class CartedProduct < ApplicationRecord
  belongs_to :child_user
  belongs_to :parent_user
  belongs_to :order, optional: true
  belongs_to :product
  belongs_to :request
end
