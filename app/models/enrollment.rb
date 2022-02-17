class Enrollment < ApplicationRecord
  belongs_to :course
  validates :student_id, uniqueness: {scope: :course_id}
end
