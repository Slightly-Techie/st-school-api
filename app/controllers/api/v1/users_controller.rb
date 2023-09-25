class Api::V1::UsersController < ApiController

    def show
        render json: UserSerializer.new(@user).serializable_hash[:data][:attributes], status: :ok
    end

    def create
        @user = User.create(user_params)
        if @user.save
          render json: UserSerializer.new(@user).serializable_hash[:data][:attributes], status: :created
        else
            render json: { errors: @user.errors }, status: :unprocessable_entity
        end
    end

    def update
        @user.update!(user_params)
        render json: UserSerializer.new(@user).serializable_hash[:data][:attributes], status: :ok
    end

    def destroy 
        @user.destroy
        head :no_content
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :role, :track)
    end
end