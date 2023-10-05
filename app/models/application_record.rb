class ApplicationRecord < ActiveRecord::Base
  include ActiveModel::Serialization
  primary_abstract_class
end
