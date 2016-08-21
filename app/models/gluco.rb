class Gluco < ApplicationRecord
  belongs_to :user

  def self.valid_params_for_create?(params)
  end
end
