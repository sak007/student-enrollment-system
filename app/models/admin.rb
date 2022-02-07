class Admin < ApplicationRecord
  has_secure_password
  validates :user_email, presence: true,format: { with: /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/,
  message: "Please Enter a valid email ID" }
  validates :name, presence: true,
  validates :password_digest, presence: true,
  validates :phone, presence: true, length: { minimum: 10,maximum: 14 }
end
