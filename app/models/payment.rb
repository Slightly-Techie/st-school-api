# == Schema Information
#
# Table name: payments
#
#  id             :bigint           not null, primary key
#  amount_paid    :integer
#  payment_method :string
#  payment_type   :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint
#
# Indexes
#
#  index_payments_on_user_id  (user_id)
#
class Payment < ApplicationRecord
    belongs_to :user

    after_create :set_amount_paid

    def set_amount_paid
        if payment_type == "Full"
            self.amount_paid = ENV["FULL"].to_i
        elsif payment_type == "Part"
            self.amount_paid = ENV["PART"].to_i
        end

        save!
    end
end
