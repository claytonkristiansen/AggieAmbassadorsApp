class AttendanceRecord < ApplicationRecord
    belongs_to :admin
    belongs_to :event
    validates :event_id, :admin_id, presence: true
end
