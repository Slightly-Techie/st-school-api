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
class PaymentSerializer
  include JSONAPI::Serializer
  attributes :payment_method, :payment_type, :amount_paid
end
