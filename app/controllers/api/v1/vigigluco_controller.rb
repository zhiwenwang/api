class Api::V1::VigiglucoController < Api::V1::BaseController
  
  def new
  end

  def create
    gluco = gluco_params[:VigiGluco]
    insulin = gluco_params[:VigiPen]
    user_id = User.find_by(email:gluco_params[:user][:email]).id
    gluco.each { |g|
      Gluco.create(
        serial_number: g[:serial_number], device_id: g[:device_id], bloodsugar_value: g[:bloodsugar_value], date: Time.at(g[:date]), meal: g[:meal], user_id: user_id
      ) } if !gluco.nil?
    insulin.each { |i|
      Insulin.create(
        serial_number: i[:serial_number], user_id: user_id
      ) } if !insulin.nil?
    render json:{
      status:1
    }
  else
    render json:{
      status: 2,
      message: errors.full_messages
    }
  end

  private
  def gluco_params
    params.permit(user:[:email], VigiGluco: [:serial_number, :device_id, :bloodsugar_value, :date, :meal], VigiPen: [:serial_number, :device_id, :date, :insulin_value])
  end

end
