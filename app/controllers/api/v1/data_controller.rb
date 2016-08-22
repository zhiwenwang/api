class Api::V1::DataController < Api::V1::BaseController

  def new
  end

  def create
    gluco = data_params[:VigiGluco]
    insulin = data_params[:VigiPen]
    user_id = User.find_by(email:data_params[:user][:email]).id
    gluco.each { |g|
      @e = Gluco.create(
        serial_number: g[:serial_number], device_id: g[:device_id], bloodsugar_value: g[:bloodsugar_value], date: Time.at(g[:date]), meal: g[:meal], user_id: user_id
      ) } if !gluco.nil?
    insulin.each { |i|
      @e = Insulin.create(
        serial_number: i[:serial_number], user_id: user_id
      ) } if !insulin.nil?
    render json:{
      status:1,
      message: "Sucesses"
    } if @e.errors.details.blank?
    render json:{
      status:2,
      message: @e.errors.details
    } if !@e.errors.details.blank?
  end

  private
  def data_params
    params.permit(user:[:email], VigiGluco: [:serial_number, :device_id, :bloodsugar_value, :date, :meal], VigiPen: [:serial_number, :device_id, :date, :insulin_value])
  end

end
