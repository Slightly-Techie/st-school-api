# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  amount                 :float
#  auth_token             :string
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
class User < ApplicationRecord
    has_secure_password
    belongs_to :stack_option
    
    

    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates_with EmailAddress::ActiveRecordValidator, field: :email
    validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*[A-Z])(?=.*[\W_])/, message: "must include at least one capital letter and one symbol" }, on: :create

    after_create :set_amount

    def set_amount
        if payment_type == "Full"
            self.amount = ENV["FULL"].to_i
        elsif payment_type == "Part"
            self.amount = ENV["PART"].to_i
        end

        save!
    end

    def token
        update(auth_token: JsonWebToken.encode({ user_id: id }))
        auth_token
    end

end
