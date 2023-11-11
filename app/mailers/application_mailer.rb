class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name("SlightlyTechieSchool.com", "JiggyNigga from SlightlyTechie")
  layout "mailer"
end
