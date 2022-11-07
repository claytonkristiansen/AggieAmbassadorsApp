class Event < ApplicationRecord
    has_many :members, through: :attendance_records
    has_many :attendance_records
end
