# frozen_string_literal: true

class Member < ApplicationRecord
    has_many :events, through: :attendance_records
    has_many :attendance_records

    devise :omniauthable, omniauth_providers: [:google_oauth2]
    def self.from_google(email:, full_name:, uid:, avatar_url:)
        return nil unless /@tamu.edu\z/.match?(email)

        member = Member.where(email: email).first
        member.update(full_name: full_name, uid: uid, avatar_url: avatar_url)
        member
    end
end
