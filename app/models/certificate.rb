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
class Certificate < ApplicationRecord
    belongs_to :user
    
    after_create :set_certificate_number

    def set_certificate_number
        self.certificate_number = "ST-#{SecureRandom.hex(6).upcase}"
        save!
    end
    
end
