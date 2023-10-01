class Stack < ApplicationRecord

  has_many :stack_options

  def attributes
    {
      name: nil
    }
  end
end
