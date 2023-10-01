class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email,:password, :password_confirmation, 
             :stack, :language, :payment_type, :payment_method, :payment_status,
             :amount, :phone_number


  

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour
end
