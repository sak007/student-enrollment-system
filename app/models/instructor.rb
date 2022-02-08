class Instructor < ApplicationRecord
  has_secure_password
  has_many :course
  validates :user_email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP,
  message: "Please Enter a valid email ID" }
  validates :name, presence: true
  validates :password_digest, presence: true
  validates :department, presence: true
end
