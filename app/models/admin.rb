# frozen_string_literal: true

class Admin < ApplicationRecord
  has_many :events, through: :attendance_records
  has_many :attendance_records
  
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  def self.from_google(email:, full_name:, uid:, avatar_url:)
    return nil unless email =~ /@tamu.edu\z/
    admin = Admin.where(email: email).first
    admin.update(full_name: full_name, uid: uid, avatar_url: avatar_url)
    return admin
  end
end
