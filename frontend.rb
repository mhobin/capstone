require 'unirest'

# show all products
# response = Unirest.get("localhost:3000/v1/products")

# response = Unirest.post("http://localhost:3000/v1/parent_users", 
#   parameters:{
#     username: "mom",
#     email: "mom@mom.com",
#     password: "password",
#     password_confirmation: "password"
#   }
#   )

# jwt = response.body["jwt"]
# p jwt
# Unirest.default_header("Authorization", "Bearer #{jwt}")

# p response.body

# #login
response = Unirest.post("http://localhost:3000/parent_user_token",
parameters: {
    auth: {
      email: "mom@mom.com",
      password: "password"
    }
  }
  )

jwt = response.body["jwt"]
p jwt
Unirest.default_header("Authorization", "Bearer #{jwt}")

#create cartedproduct after login
response = Unirest.post("http://localhost:3000/v1/carted_products", parameters:{
  product_id: 1,
  quantity: 2,
  child_user_id: 1
  })

p response.body