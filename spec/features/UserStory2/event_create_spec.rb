require 'rails_helper'

RSpec.describe "events/new", type: :feature do

  it "Can create a new event" do

    admin = Admin.create!(email: "fakeemail@tamu.edu", full_name: "Example User", privilege_level: 20)
    allow_any_instance_of(Devise::Controllers::Helpers).to receive(:admin_signed_in?).and_return(true)
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:admin]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    visit "admins/sign_in"
    click_on "Sign in with Google"

    visit "events/new"
    fill_in 'event_title', with: 'Party'
    select '2022', :from => "event_event_date_1i"
    select 'January', :from => "event_event_date_2i"
    select '1', :from => "event_event_date_3i"
    select '02', :from => "event_event_time_4i"
    select '30', :from => "event_event_time_5i"
    fill_in 'event_location', with: 'My house'
    fill_in 'event_description', with: 'House party'
    click_on 'Create Event'


  #  event_date: '2022-01-01', event_time: '02-30-00',
    expect(Event.where(title: 'Party', event_date: '2022-01-01', event_time: '02:30:00', location: 'My house', description: 'House party')).to exist
  end

end
