require 'unirest'

# show all products
# response = Unirest.get("localhost:3000/v1/products")

# create parent user
# response = Unirest.post("http://localhost:3000/v1/parent_users", 
#   parameters:{
#     username: "mom",
#     email: "mom@mom.com",
#     password: "password",
#     password_confirmation: "password"
#   }
#   )

#create child user

# response = Unirest.post(
#   "http://localhost:3000/v1/child_users",
#   parameters: {
#     username: "maggie",
#     email: "maggie@child.com",
#     password: "password",
#     password_confirmation: "password",
#     parent_user_id: 1
#   }
# )
# p response.body


# jwt = response.body["jwt"]
# p jwt
# Unirest.default_header("Authorization", "Bearer #{jwt}")

# p response.body

# # parent login
# response = Unirest.post("http://localhost:3000/parent_user_token",
# parameters: {
#     auth: {
#       email: "mom@llllllmom.com",
#       password: "password"
#     }
#   }
#   )

# jwt = response.body["jwt"]
# p jwt
# Unirest.default_header("Authorization", "Bearer #{jwt}")

# #create cartedproduct after parent login
# response = Unirest.post("http://localhost:3000/v1/carted_products", parameters:{
#   product_id: 1,
#   quantity: 2,
#   child_user_id: 1
#   })

# p response.body

# child login
 response = Unirest.post("http://localhost:3000/child_user_token",
parameters: {
    auth: {
      email: "maggie@child.com",
      password: "password"
    }
  }
  )

jwt = response.body["jwt"]
p jwt
Unirest.default_header("Authorization", "Bearer #{jwt}")

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


#child create order after login

# response = Unirest.post("localhost:3000/v1/orders")

# p response.body

#show cart after child_user login
# response = Unirest.get("http://localhost:3000/v1/cartedproducts")

# puts response.body

# #create cp after child login
# response = Unirest.post("http://localhost:3000/v1/carted_products", parameters:{
#   product_id: 10,
#   quantity: 2,
#   parent_user_id: 1
#   })

# p response.body