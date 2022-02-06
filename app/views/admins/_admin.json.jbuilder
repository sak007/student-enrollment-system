json.extract! admin, :id, :name, :user_email, :phone, :created_at, :updated_at
json.url admin_url(admin, format: :json)
