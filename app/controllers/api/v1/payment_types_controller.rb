class Api::V1::PaymentTypesController < ApplicationController
    def index
        @payment_types = PaymentType.all
        @payment_methods = PaymentMethod.all
        render json: {
            payment_types: @payment_types.map { |payment_type| payment_type.serializable_hash(only: 'name') },
            payment_methods: @payment_methods.map { |payment_method| payment_method.serializable_hash(only: 'name') }
        }

        
    end
end