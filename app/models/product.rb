class Product < ApplicationRecord
  has_many :carted_products
  has_many :orders

  def as_json
    {
      name: name,
      image: image,
      salePrice: salePrice
    }
  end
end
