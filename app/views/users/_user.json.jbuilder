<<<<<<< HEAD
# frozen_string_literal: true

json.extract!(user, :id, :auth_id, :position_title, :priviledged, :preferred_name, :created_at,
              :updated_at
)
json.url(user_url(user, format: :json))
=======
# frozen_string_literal: true

json.extract!(user, :id, :auth_id, :position_title, :priviledged, :preferred_name, :created_at, :updated_at)
json.url(user_url(user, format: :json))
>>>>>>> 9f315ecc432b1453014cf88a1b00c95a25d718a4
