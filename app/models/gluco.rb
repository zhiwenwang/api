class Gluco < ApplicationRecord
  belongs_to :user
  # before_save :valid_params_for_create
    validates_presence_of :serial_number, :device_id, :bloodsugar_value, :date, :meal

  # def valid_params_for_create
  #   validates_presence_of :serial_number, :message => "serial_number is empty"
  # end
end
