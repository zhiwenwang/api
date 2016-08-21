class UserController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:login, :create, :new]
  before_action :user_params, only: [:login]
  def new
  end

  def create 
    p user_params[:password]
    p user_params["email"]
    begin
    @users = User.new(user_params)
      if @users.valid? 
        @users.save
        render json: {
        status: 1,
        message: "Success"
      }
      elsif
        render json:{
          status: 2,
          message: @users.errors.full_messages
        }
      end
    end
  end

  def login
    user = User.find_by_email(user_params[:email])
    p user[:password_digest]
      if user.present?
        if user && user.authenticate(user_params[:password])
        render json:{
          status: 1,
          Memo: "20" #-----todo
        }.to_json
        else
          render json:{
            status: 3,
            message: "password is not corrent"
          }
        end
      elsif  
        render json:{
          status:2,
          message: "no user"
        }
      end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
