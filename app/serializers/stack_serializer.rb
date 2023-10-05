class StackSerializer
  include JSONAPI::Serializer
  attributes :name

  has_many :stack_options
end
