require 'unirest'

response = Unirest.get("localhost:3000/v1/products")

p response.body