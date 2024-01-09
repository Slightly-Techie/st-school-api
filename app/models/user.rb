# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  auth_token             :string
#  completed              :boolean
#  email                  :string
#  first_name             :string
#  last_name              :string
#  password_digest        :string
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
    has_one :certificate
    has_many :payments




    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    # validates_with EmailAddress::ActiveRecordValidator, field: :email
    validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*[A-Z])(?=.*[\W_])/, message: "must include at least one capital letter and one symbol" }, on: :create



    def payment_status
        amount_paid = payments.sum(:amount_paid)
        if amount_paid == ENV["FULL"].to_i
            "Full"
        elsif amount_paid == ENV["PART"].to_i
            "Part"
        else
            "Non Payments made"
        end
    end

    def total_amount_paid
        payments.sum(:amount_paid)
    end

    def remaining_payment_balance
      return 0 if payment_status == "Full"
      ENV["PART_PAYMENT_FULL_AMOUNT"].to_i - total_amount_paid
    end


    def token
        update(auth_token: JsonWebToken.encode({ user_id: id }))
        auth_token
    end

    def generate_password_token!
        self.reset_password_token = SecureRandom.hex(3).upcase
        self.reset_password_sent_at = Time.now.utc
        save!
    end


    def token_valid?
        reset_password_sent_at.present? && reset_password_sent_at + 4.hours < Time.now
    end


    def reset_password!(password)
        self.reset_password_token = nil
        self.password = password
        self.password_confirmation = password
        save!
    end

end
