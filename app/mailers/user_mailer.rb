class UserMailer < ApplicationMailer
    default from: "slightlytechie@gmail.com"
    def reset_password_email
        @user = params[:user]
        @url = "#{ENV.fetch('EMAIL_URL', 'http://localhost:6002')}/reset-password/#{@user[:reset_password_token]}"
        mail(to: @user.email, subject: "Reset your password", from: "slightlytechie@gmail.com")
    end
end