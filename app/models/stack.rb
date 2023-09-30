class Stack < ApplicationRecord
include ActiveModel::Serialization
  has_many :stack_options

  def attributes
    {
      name: nil
    }
  end
end
