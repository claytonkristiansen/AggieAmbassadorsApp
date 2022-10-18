class Event < ApplicationRecord
    has_many :admins, through: :attendance_records
    has_many :attendance_records
end