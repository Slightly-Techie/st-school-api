class Api::V1::CertificatesController < ApplicationController
    before_action :set_current_user, only: [:create]

    def show
        user = User.find(params[:id])
        
        if user
            certificate = Certificate.find_by(user: user)
            if certificate
                render json: CertificateSerializer.new(certificate).serializable_hash[:data][:attributes], status: :ok
            else
                render json: { errors: "No certificate found" }, status: :not_found
            end
        else
            render json: { errors: "No user found" }, status: :not_found
        end
    end

    def create
        
        if @current_user.eligible_for_certificate?
            certificate = Certificate.new(cert_params)            
            if certificate.save!
                render json: CertificateSerializer.new(certificate).serializable_hash[:data][:attributes], status: :created
            else
                render json: { errors: "User not eligible for certificate" }, status: :unprocessable_entity
            end
        end
    end

    private

    def set_current_user
        @current_user = User.find(params[:user_id])
        return render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
        @current_user
    end

    def cert_params
        params.permit( :cohort, :completion_date, :user_id)
    end

end