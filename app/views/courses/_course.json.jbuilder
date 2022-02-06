json.extract! course, :id, :name, :description, :instructor_id, :weekday1, :weekday2, :starttime, :endtime, :code, :capacity, :wlcapacity, :status, :room, :created_at, :updated_at
json.url course_url(course, format: :json)
