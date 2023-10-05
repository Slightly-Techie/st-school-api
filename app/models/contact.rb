# == Schema Information
#
# Table name: contacts
#
#  id           :bigint           not null, primary key
#  contact_type :integer
#  email        :string
#  phone        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_contacts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Contact < ApplicationRecord
  belongs_to :user

  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates_with EmailAddress::ActiveRecordValidator, field: :email

  enum contact_type: {Email: "Email", Phone: "Phone"}

end
