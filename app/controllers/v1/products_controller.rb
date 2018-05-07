class V1::ProductsController < ApplicationController
  # bb api request
  # def index
  #   response = Unirest.get("https://api.bestbuy.com/v1/products(type=hardgood)?format=json&show=sku,name,class,condition,department,longDescription,shortDescription,shippingCost,regularPrice,salePrice,image,color,preowned&pageSize=100&cursorMark=*&apiKey=#{ENV['API_KEY']}")
  #   render json: response.body
  # end

def index
  products = Product.all
  render json: products.as_json
end

def show
  id = params[:id]
  product = Product.find_by(id: id)
  render json: product.as_json
end

end

