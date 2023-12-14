# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Setup ActionMailer
ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "gmail.com",
  user_name: ENV.fetch("GMAIL_USERNAME", nil),
  password: ENV.fetch("GMAIL_APP_PASSWORD", nil),
  authentication: "plain",
  enable_starttls_auto: true
}