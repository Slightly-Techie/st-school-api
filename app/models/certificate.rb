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
class Certificate < ApplicationRecord
    belongs_to :user
    belongs_to :stack
    belongs_to :stack_option
    
end
