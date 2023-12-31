# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  auth_token             :string
#  completed              :boolean
#  email                  :string
#  first_name             :string
#  last_name              :string
#  password_digest        :string
#  phone_number           :string
#  reset_password_sent_at :time
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  stack_option_id        :bigint           not null
#
# Indexes
#
#  index_users_on_stack_option_id  (stack_option_id)
#
# Foreign Keys
#
#  fk_rails_...  (stack_option_id => stack_options.id)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
