class V1::ProductsController < ApplicationController
  def index
    response = Unirest.get("https://api.bestbuy.com/v1/products(type=hardgood)?format=json&show=sku,name,class,condition,department,longDescription,shortDescription,shippingCost,regularPrice,salePrice,image,color,preowned&pageSize=100&cursorMark=*&apiKey=#{ENV['API_KEY']}")
    render json: response.body
  end
end
