# == Schema Information
#
# Table name: stack_options
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stack_id   :bigint           not null
#
# Indexes
#
#  index_stack_options_on_stack_id  (stack_id)
#
# Foreign Keys
#
#  fk_rails_...  (stack_id => stacks.id)
#
FactoryBot.define do
  factory :stack_option do
    name { "MyString" }
    stack { nil }
  end
end
