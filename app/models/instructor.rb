class Instructor < ApplicationRecord
  has_secure_password
  has_many :course
  validates :user_email, presence: true, uniqueness: true, format: { with: /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/,
  message: "Please Enter a valid email ID" }
  validates :name, presence: true,
  validates :password_digest, presence: true,
  validates :department, presence: true
end
