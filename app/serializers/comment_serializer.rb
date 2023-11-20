class CommentSerializer
  include JSONAPI::Serializer
  attributes :body, :user_name, :user_email
end
