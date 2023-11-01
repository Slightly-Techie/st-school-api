# == Schema Information
#
# Table name: certificates
#
#  id              :bigint           not null, primary key
#  cohort          :string
#  completion_date :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  certificate_id  :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_certificates_on_user_id  (user_id)
#
FactoryBot.define do
  factory :certificate do
    certificate_id { "" }
    issue_date { "2023-10-30 23:50:14" }
  end
end
