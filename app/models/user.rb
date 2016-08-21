class User < ApplicationRecord
  has_many :glucos
  has_many :insulins
  attr_accessor :reset_token, :user, :password_confirmation
  validates_format_of :email, :with => /@/, message: "email format is not correct"
  validates :email, :uniqueness => {:scope => [:email], message: "user is exist"}
  has_secure_password

  def send_password_reset
    reset_token = SecureRandom.urlsafe_base64
    self.reset_digest = reset_token
    self.reset_sent_at = Time.zone.now
    save!
    UserMailer.password_resets(self).deliver
  end

end
