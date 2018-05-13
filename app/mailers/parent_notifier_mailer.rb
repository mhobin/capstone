class ParentNotifierMailer < ApplicationMailer

#WORKING ISH  
  require 'sendgrid-ruby'
  include SendGrid
 
  default :from => 'any_from_address@example.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(parent_user)
    @parent_user = parent_user
    mail( :to => @parent_user.email,
    :subject => 'Thanks for signing up for our amazing app',
    :content => 'contentcontentcontentcontentcontent',
    :body => 'bodybodybody' )
  end
end

# require 'sendgrid-ruby'
# include SendGrid

# from = Email.new(email: 'test@example.com')
# to = Email.new(email: 'hobin.margaret@gmail.com')
# subject = 'Sending with SendGrid is Fun'
# content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
# mail = Mail.new(from, subject, to, content)

# sg = SendGrid::API.new(api_key: ENV['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'])
# response = sg.client.mail._('send').post(request_body: mail.to_json)
# puts response.status_code
# puts response.body
# puts response.headers
# end

#  default from: 'notifications@example.com'
 
#   def welcome_email
#     @user = params[:parent_user]
#     @url  = 'http://example.com/login'
#     mail(to: @user.email, subject: 'Welcome to My Awesome Site')
#   end
# end
