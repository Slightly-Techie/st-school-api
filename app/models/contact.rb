class Contact < ApplicationRecord
  belongs_to :user

  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates_with EmailAddress::ActiveRecordValidator, field: :email

  enum contact_type: {Email: "Email", Phone: "Phone"}

end
