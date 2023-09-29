FactoryBot.define do
  factory :contact do
    contact_type { false }
    phone { "MyString" }
    email { "MyString" }
    user { nil }
  end
end
