class V1::OrdersController < ApplicationController
  # before_action :authenticate_parent_user
  before_action :authenticate_child_user

  def index
    orders = current_child_user.orders
    render json: orders.as_json
  end

  #need to create orders before can show duh

  def create
    carted_products = current_child_user.carted_products.where(status: "carted")
    
    order = Order.new(
      child_user_id: current_child_user.id,
      parent_user_id: current_child_user.parent_user_id,
      total: 700
      )
    order.save
    carted_products.update_all(status: "pending", order_id: order.id)
    ParentNotifierMailer.send_signup_email(current_parent_user).deliver_now
  end

end
