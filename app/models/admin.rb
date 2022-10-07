class Admin < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  def self.from_google(email:, full_name:, uid:, avatar_url:)
    return nil unless email =~ /@tamu.edu\z/
    Admin.find(email: email, full_name: full_name).first
  end
end
