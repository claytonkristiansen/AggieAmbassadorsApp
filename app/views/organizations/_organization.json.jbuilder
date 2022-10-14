<<<<<<< HEAD
# frozen_string_literal: true

json.extract!(organization, :id, :name, :contact_name, :contact_email, :contact_phone,
              :contact_title, :created_at, :updated_at
)
json.url(organization_url(organization, format: :json))
=======
# frozen_string_literal: true

json.extract!(organization, :id, :name, :contact_name, :contact_email, :contact_phone, :contact_title, :created_at, :updated_at)
json.url(organization_url(organization, format: :json))
>>>>>>> 9f315ecc432b1453014cf88a1b00c95a25d718a4
