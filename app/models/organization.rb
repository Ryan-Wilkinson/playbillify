class Organization < ApplicationRecord
  belongs_to :user
  has_many :events
  after_initialize :set_defaults, unless: :persisted?
  def set_defaults
    self.photo_url ||= '#'
  end
end
# class Model < ActiveRecord::Base
#   after_initialize :set_defaults, unless: :persisted?
#   # The set_defaults will only work if the object is new

#   def set_defaults
#     self.attribute  ||= 'some value'
#     self.bool_field = true if self.bool_field.nil?
#   end
# end
