# == Schema Information
#
# Table name: stacks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class StackSerializer
  include JSONAPI::Serializer
  attributes :name

  has_many :stack_options
end
