class Api::V1::PasswordsController < ApplicationController
    def create
        user = User.find_by_email(params[:email])

        if user
          user.generate_password_token!
          UserMailer.with(user: user).reset_password_email.deliver_now
          render json: { message: "Email sent with password reset instructions." }, status: :ok
        else
          render json: { error: "Email address not found. Please check and try again." }, status: :not_found
        end
    end

    def update
        user = User.find_by_reset_password_token(params[:token])

        if user&.token_valid?
          if user.reset_password!(params[:password])
            render json: { message: "Password reset successful." }, status: :ok
          else
            render json: { error: user.errors.full_messages.join(", ") }, status: :unprocessable_entity
          end
        else
          render json: { error: "Link not valid or expired. Try generating a new link." }, status: :unprocessable_entity
        end
    end
end
