# frozen_string_literal: true

json.extract!(user, :id, :auth_id, :position_title, :priviledged, :preferred_name, :created_at, :updated_at)
json.url(user_url(user, format: :json))
