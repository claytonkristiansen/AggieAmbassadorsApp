json.extract!(location, :id, :name, :description, :type, :instructions, :address, :created_at, :updated_at)
json.url(location_url(location, format: :json))
