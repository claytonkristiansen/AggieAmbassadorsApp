# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :authenticate_member!
    helper_method :is_owner?
    helper_method :is_event_creater?
    helper_method :is_member?
    helper_method :get_id
    helper_method :satisfied_requirement

    def get_privilege
        user = Member.where(email: session[:user_email]).first
        return -1 if user.nil?

        user.privilege_level
    end

    def is_owner?
        get_privilege == 30
    end

    def is_event_creater?
        get_privilege >= 20
    end

    def is_member?
        get_privilege >= 10
    end

    def get_id
        user = Member.where(email: session[:user_email]).first
        return -1 if user.nil?

        user.id
    end

    def satisfied_requirement
        count = AttendanceRecord.where(member_id: @member.id, attended: true).count
    end
end
