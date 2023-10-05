# == Schema Information
#
# Table name: stacks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Stack < ApplicationRecord
  
  has_many :stack_options

  def attributes
    {
      name: nil
    }
  end
end
