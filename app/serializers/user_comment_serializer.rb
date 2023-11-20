# == Schema Information
#
# Table name: user_comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  user_email :string
#  user_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserCommentSerializer
  include JSONAPI::Serializer
  attributes :body, :user_name, :user_email
end
