class UserMailer < ApplicationMailer
  default_url_options[:host] = "localhost:3000" 

  def password_resets(user)
    @user = user
    mail(to: "#{user.email}",
       subject: "Reset Your Password")
  end
end
