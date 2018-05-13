class V1::RequestsController < ApplicationController
  def index
    if current_parent_user
      pending = current_parent_user.carted_products.where(status: "pending")
      render json: pending.as_json
    end
  end
end
