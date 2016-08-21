class PasswordResetsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :new, :edit, :update]
  protect_from_forgery with: :null_session
  before_action :get_user, only: [:edit, :update, :create]

  def new
  end

  def create
    if @user
    @user.send_password_reset 
    render json:{
      status:@user.password
    }
    else
      render json:{
        status: 2,
        message: 'no user'
      }
    end
  end

  def edit

  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif user_params[:password] == user_params[:password_confirmation]
      @user.update_attributes(user_params)
      render json:{
        status:1   
      }
    else
      render 'edit'
    end
  end
  
  private

  def forget_password_params
    params.permit(:email)
  end

  def get_user
    @user = User.find_by_email(params[:user][:email])
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
