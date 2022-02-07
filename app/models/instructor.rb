class Instructor < ApplicationRecord
  has_secure_password
  has_many :course
end
