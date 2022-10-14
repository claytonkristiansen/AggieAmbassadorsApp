require 'rails_helper'

RSpec.describe "organizations/index", type: :view do
  before(:each) do
    assign(:organizations, [
      Organization.create!(
        name: "Name",
        contact_name: "Contact Name",
        contact_email: "Contact Email",
        contact_phone: "Contact Phone",
        contact_title: "Contact Title"
      ),
      Organization.create!(
        name: "Name",
        contact_name: "Contact Name",
        contact_email: "Contact Email",
        contact_phone: "Contact Phone",
        contact_title: "Contact Title"
      )
    ])
  end

  before do
    admin = Admin.create!(email: "fakeemail@tamu.edu", full_name: "Example User")
    allow_any_instance_of(Devise::Controllers::Helpers).to receive(:admin_signed_in?).and_return(true)
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:admin]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    Rails.application.env_config['warden'] = 
    visit "admins/sign_in"
    click_on "Sign in with Google"
  end

  it "renders a list of organizations" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    # assert_select "tr>td", text: "Contact Name".to_s, count: 2
    # assert_select "tr>td", text: "Contact Email".to_s, count: 2
    # assert_select "tr>td", text: "Contact Phone".to_s, count: 2
    # assert_select "tr>td", text: "Contact Title".to_s, count: 2
  end

  after do
    visit destroy_admin_session_path
  end
end
