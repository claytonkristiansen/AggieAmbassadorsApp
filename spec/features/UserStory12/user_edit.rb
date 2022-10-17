require 'rails_helper'

RSpec.describe "admin/create", type: :view do

  it "Edit users" do
    # Create
    visit "creating_new_user"
    fill_in 'admin_email', with: 'email@email.com'
    fill_in 'admin_preferred_name', with: 'Example User'
    click_on 'Create Admin'

    admin = Admin.create!(email: "fakeemail@tamu.edu", full_name: "Example User", privilege_level: 30)
    allow_any_instance_of(Devise::Controllers::Helpers).to receive(:admin_signed_in?).and_return(true)
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:admin]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

    visit "admins/sign_in"
    click_on "Sign in with Google"

    visit "admins"
    assert_text "20", count: 0
    assert_text "Project Tester", count: 0

    first(:link, "Edit").click
    fill_in 'admin_privilege_level', with: 20
    fill_in 'admin_position_title', with: "Project Tester"
    click_on "Update Admin"

    assert_text "20", count: 1
    assert_text "Project Tester", count: 1
  end

end