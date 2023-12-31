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
require 'rails_helper'

RSpec.describe Payment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
