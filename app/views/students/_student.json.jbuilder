json.extract! student, :id, :name, :dob, :user_email, :phone, :major, :created_at, :updated_at
json.url student_url(student, format: :json)
