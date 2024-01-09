class Api::V1::UsersController < ApplicationController

    def show
        render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
    end

    def create
        stack_option = StackOption.find_by(name: params[:stack_option])
        ActiveRecord::Base.transaction do 
            @user = User.create!(user_params.except(:stack_option).merge(stack_option: stack_option))
            Payment.create!(payment_params.merge(user: @user)) if @user.present? && @user.persisted?
        end
            if @user.save
            render json: UserSerializer.new(@user).serializable_hash[:data][:attributes], status: :created
            else
                render json: { errors: @user.errors }, status: :unprocessable_entity
            end
    end

    def check_email
        user_exists = User.exists?(email: params[:email])
        render json: { user_exists: user_exists }, status: :ok
    end

    def update
        @user.update(user_params)
        render json: UserSerializer.new(@user).serializable_hash[:data][:attributes], status: :ok
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :email,:password, :password_confirmation, 
                      :phone_number, :stack_option, :completed)
    end

    def payment_params
        params.permit(:payment_method, :payment_type)
    end
end