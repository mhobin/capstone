class V1::ParentUsersController < ApplicationController
  def create
    parent_user = ParentUser.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )

    if parent_user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: parent_user.errors.full_messages}, status: :bad_request
    end
  end
end
