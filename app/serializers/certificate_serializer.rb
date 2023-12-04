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
class CertificateSerializer
  include JSONAPI::Serializer
  attributes :certificate_number, :completion_date, :cohort

  attribute :user do |certificate|
    UserSerializer.new(certificate.user).serializable_hash.dig(:data, :attributes).slice(:first_name, :last_name, :stack_option)
  end

  belongs_to :user

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour 
end
