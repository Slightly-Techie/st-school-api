class Api::V1::PaymentsController < ApplicationController

    def create
        @user = User.find_by(id: params[:user_id])
        @payment = Payment.create(payment_params)

        if @payment.save
            render json: PaymentSerializer.new(@payment).serializable_hash[:data][:attributes], status: :created
        else
            render json: { errors: @payment.errors }, status: :unprocessable_entity
        end
    end

    private

    def payment_params
        params.permit(:payment_method, :payment_type, :user_id)
    end
end