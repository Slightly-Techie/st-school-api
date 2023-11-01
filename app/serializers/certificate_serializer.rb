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
class CertificateSerializer
  include JSONAPI::Serializer
  attributes :certificate_id, :completion_date, :cohort

  belongs_to :user

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour 
end
