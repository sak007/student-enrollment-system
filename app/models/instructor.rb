class Instructor < ApplicationRecord
  has_secure_password

  validates :user_email, presence: true, uniqueness: true
end
