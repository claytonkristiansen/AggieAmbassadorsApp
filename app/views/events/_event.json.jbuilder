json.extract! event, :id, :title, :event_date, :event_time, :location, :description, :created_at, :updated_at
json.url event_url(event, format: :json)
