# == Schema Information
#
# Table name: payment_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe PaymentType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
