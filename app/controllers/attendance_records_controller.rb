class AttendanceRecordsController < ApplicationController
    def index
        @attendance_records = AttendanceRecord.all
    end

    def show; end

    def delete
        @attendance_record = AttendanceRecord.find(params[:id])
    end

    # Attendance Record controller method that actually deletes attendance record item from database
    def destroy
        @attendance_record = AttendanceRecord.find(params[:id])
        @attendance_record.destroy

        respond_to do |format|
            format.html { redirect_to(attendance_records_url, notice: 'Attendance Record was successfully destroyed.') }
            format.json { head(:no_content) }
        end
    end

    def edit;

    end

    def new
        @attendance_record = AttendanceRecord.new
    end
end
