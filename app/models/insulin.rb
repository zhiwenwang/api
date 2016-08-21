class Insulin < ApplicationRecord
  belongs_to :user
  validates_presence_of :insulin_value, message: "insulin_value empty"
end
