class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email, :role, :track, :created_at, :updated_at

  # has_many :contacts

  cache_options store: Rails.cache, namespace: "jsonapi-serializer", expires_in: 1.hour
end
