module Authenticable
    def current_user
      return @current_user if @current_user
  
      token = extract_token_from_request
      @current_user ||= find_current_user_by_token(token)
      @current_user
    end

    private

    def extract_token_from_request
      token = request.headers["Authorization"]&.split&.last
      raise JWT::DecodeError, "Invalid Credentials" unless token

      token
    end

    def find_current_user_by_token(token)
        decoded_token = JsonWebToken.decode(token)
        User.find(decoded_token[:user_id])
      rescue ActiveRecord::RecordNotFound
    end
end