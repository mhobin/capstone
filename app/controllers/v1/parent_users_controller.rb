class V1::ParentUsersController < ApplicationController

  # def create
  #   parent_user = ParentUser.new(
  #     username: params[:username],
  #     email: params[:email],
  #     password: params[:password],
  #     password_confirmation: params[:password_confirmation]
  #     )

  #   if parent_user.save
  #     render json: {message: 'User created successfully'}, status: :created
  #   else
  #     render json: {errors: parent_user.errors.full_messages}, status: :bad_request
  #   end
  # end


  def create
    # Create the user from params
    parent_user = ParentUser.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if parent_user.save
      # Deliver the signup email
      ParentNotifierMailer.send_signup_email(parent_user).deliver_now
      # redirect_to(parent_user, notice => 'User created')
    else
      render :action => 'new'
    end
  end
end

#   def create
#     @user = ParentUser.new(
#       username: params[:username],
#       email: params[:email],
#       password: params[:password],
#       password_confirmation: params[:password_confirmation]
#       )
 
#     respond_to do |format|
#       if @user.save
#         # Tell the UserMailer to send a welcome email after save
#         UserMailer.with(user: @user).welcome_email.deliver_now
 
#         format.html { redirect_to(@user, notice: 'User was successfully created.') }
#         format.json { render json: @user, status: :created, location: @user }
#       else
#         format.html { render action: 'new' }
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end
#   end
# end
