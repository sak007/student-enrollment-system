json.extract! enrollment, :id, :course_id, :student_id, :status, :created_at, :updated_at
json.url enrollment_url(enrollment, format: :json)
