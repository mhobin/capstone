class V1::ChildUsersController < ApplicationController
  def create
    child_user = ChildUser.new(
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      parent_user_id: params[:parent_user_id],
      email: params[:email]
      )

    if child_user.save
      render json: {message: 'child user created successfully'}, status: :created
    else
      render json: {errors: child_user.errors.full_messages}, status: :bad_request
    end
  end
end
