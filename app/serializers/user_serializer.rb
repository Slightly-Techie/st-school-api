# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  amount                 :float
#  auth_token             :string
#  completed              :boolean
#  email                  :string
#  first_name             :string
#  last_name              :string
#  password_digest        :string
#  payment_method         :string
#  payment_status         :string
#  payment_type           :string
#  phone_number           :string
#  reset_password_sent_at :time
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  stack_option_id        :bigint           not null
#
# Indexes
#
#  index_users_on_stack_option_id  (stack_option_id)
#
# Foreign Keys
#
#  fk_rails_...  (stack_option_id => stack_options.id)
#
class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :id, :email,:password, :password_confirmation, 
             :payment_type, :payment_method, :payment_status,
             :amount, :phone_number, :completed

  attribute :stack_option do |user|
    StackOptionSerializer.new(user.stack_option).serializable_hash[:data][:attributes]
  end

  belongs_to :stack_option  

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour
end
