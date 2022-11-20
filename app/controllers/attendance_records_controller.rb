class AttendanceRecordsController < ApplicationController
    before_action :restrict_access, only: %i[index show delete destroy edit new]

    # so members can't access page through direct link
    def restrict_access
        if !is_owner?
            redirect_to('/', notice: 'You do not have access to this page!')
        end
    end
    def index
        redirect_to(new_member_session_path, notice: 'You are not authorized.') unless is_owner?
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

    def edit; end

    def new
        @attendance_record = AttendanceRecord.new
    end
end
