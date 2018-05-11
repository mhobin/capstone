class V1::CartedProductsController < ApplicationController
  def create
    if current_child_user
      cp = CartedProduct.new(
      product_id: params[:inputProductId],
      quantity: params[:inputQuantity],
      parent_user_id: current_child_user.parent_user_id,
      child_user_id: current_child_user.id,
      status: "carted"
      )
      if cp.save
        render json: cp.as_json
      else
        render json: {message: cp.errors.full_messages}
      end
    end
  end 

  # def create
  #     cp = CartedProduct.new(
  #     product_id: params[:product_id],
  #     quantity: params[:quantity],
  #     parent_user_id: params[:parent_user_id],
  #     child_user_id: params[:child_user_id],
  #     status: "carted"
  #     )
  #     if cp.save
  #       render json: cp.as_json
  #     else
  #       render json: {message: cp.errors.full_messages}
  #     end
  #   end
  # end 


  def index
    # render json: {message: "test"}
    cp = current_child_user.carted_products
    render json: cp.as_json
  end
end
