json.extract! booking, :id, :code, :date, :people, :user_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
