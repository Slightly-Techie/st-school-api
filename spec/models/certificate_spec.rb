# == Schema Information
#
# Table name: certificates
#
#  id                 :bigint           not null, primary key
#  certificate_number :string
#  cohort             :string
#  completion_date    :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint
#
# Indexes
#
#  index_certificates_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Certificate, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
