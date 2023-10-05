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
class StackOptionSerializer
  include JSONAPI::Serializer
  attributes :name

  attribute :stack do |stack_option|
    StackSerializer.new(stack_option.stack).serializable_hash[:data][:attributes].slice(:name)
  end


  belongs_to :stack

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour
end
