class AttendanceRecordsController < ApplicationController
    def index
        @attendance_record = AttendanceRecord.all
    end

    def show; end

    def new
        @attendance_record = AttendanceRecord.new
    end
end
