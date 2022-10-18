require 'rails_helper'

RSpec.describe "admin/destroy", type: :feature do

  it "delete users" do
    # Create
    visit "creating_new_user"
    fill_in 'admin_email', with: 'email@email.com'
    fill_in 'admin_preferred_name', with: 'Example User'
    click_on 'Create Admin'

    visit "creating_new_user"
    fill_in 'admin_email', with: 'email2@email.com'
    fill_in 'admin_preferred_name', with: 'Example User'
    click_on 'Create Admin'

    admin = Admin.create!(email: "fakeemail@tamu.edu", full_name: "Example User", privilege_level: 30)
    allow_any_instance_of(Devise::Controllers::Helpers).to receive(:admin_signed_in?).and_return(true)
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:admin]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

    visit "admins/sign_in"
    click_on "Sign in with Google"

    visit "admins"
    assert_text "Example User", count: 3

    first(:link, "Remove").click
    click_on "Delete"
    assert_text "Example User", count: 2
  end

end
