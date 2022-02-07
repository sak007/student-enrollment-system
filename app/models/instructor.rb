class Instructor < ApplicationRecord
  has_secure_password
  has_many :course
<<<<<<< Updated upstream
  validates :user_email, presence: true, uniqueness: true, format: { with: /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/,
  message: "Please Enter a valid email ID" }
=======
  validates :user_email, presence: true,format: { with: /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/,
  message: "Please Enter a valid email ID" },uniqueness: true,
>>>>>>> Stashed changes
  validates :name, presence: true,
  validates :password_digest, presence: true,
  validates :department, presence: true
end
