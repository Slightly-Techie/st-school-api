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
require 'rails_helper'

RSpec.describe StackOption, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
