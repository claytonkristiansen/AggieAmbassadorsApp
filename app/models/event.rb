class Event < ApplicationRecord
    has_many :members, through: :attendance_records
    has_many :attendance_records
    has_one :location
    accepts_nested_attributes_for :location
end
