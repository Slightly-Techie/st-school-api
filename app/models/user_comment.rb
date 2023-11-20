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
class UserComment < ApplicationRecord
    validates :body, presence: true
    validates :user_name, presence: true
    validates :user_email, presence: true
end
