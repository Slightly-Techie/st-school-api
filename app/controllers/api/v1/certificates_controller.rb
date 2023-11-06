class Api::V1::CertificatesController < ApplicationController

    def show
        first_name = params[:first_name]
        last_name = params[:last_name]

        user = User.find_by(first_name: first_name, last_name: last_name)
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
end