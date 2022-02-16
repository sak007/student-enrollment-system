class Admin < ApplicationRecord
  has_secure_password
  validates :user_email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP,
  message: "Please Enter a valid email ID" }
  validates :name, presence: true
  validates :password_digest, presence: true
  validates :phone, presence: true, length: { minimum: 10,maximum: 14 }
end
