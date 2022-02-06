json.extract! instructor, :id, :name, :user_email, :department, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
