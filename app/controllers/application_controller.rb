# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :authenticate_admin!
    helper_method :is_owner?
    helper_method :is_event_creater?
    helper_method :is_member?
    helper_method :get_id

    def get_privilege
        user = Admin.where(email: session[:user_email]).first
        if user == nil
            return -1
        end
        return user.privilege_level
    end

    def is_owner?
        get_privilege == 30
    end

    def is_event_creater?
        get_privilege >= 20
    end

    def is_member?
        get_privilege == 10
    end

    def get_id 
        user = Admin.where(email: session[:user_email]).first
        if user == nil
            return -1
        end
        return user.id
    end
end