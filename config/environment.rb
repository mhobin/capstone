# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
# config.action_mailer.raise_delivery_errors = true

 ActionMailer::Base.smtp_settings = {
  :user_name => 'parent.capstone@gmail.com',
  :password => '********',
  :domain => 'mail.google.com',
  :address => 'smtp.gmail.com',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
