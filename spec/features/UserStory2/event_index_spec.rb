require 'rails_helper'

RSpec.describe('event/index', type: :feature) do
    it 'All users can see events' do
        # Create
        member = Member.create!(email: 'fakeemail@tamu.edu', full_name: 'Example User', privilege_level: 30)
        allow_any_instance_of(Devise::Controllers::Helpers).to(receive(:member_signed_in?).and_return(true))
        Rails.application.env_config['devise.mapping'] = Devise.mappings[:member]
        Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
        visit 'members/sign_in'
        click_on 'Sign in with Google'

        Location.create!([{name: 'Example'}])

        visit 'events/new'
        fill_in 'event_title', with: 'Party'
        select '2022', from: 'event_event_date_1i'
        select 'January', from: 'event_event_date_2i'
        select '1', from: 'event_event_date_3i'
        select '02', from: 'event_event_time_4i'
        select '30', from: 'event_event_time_5i'
        select 'Example', from: 'event_location_id'
        fill_in 'event_description', with: 'House party'
        click_on 'Create Event'

        visit 'events/new'
        fill_in 'event_title', with: 'Book Club'
        select '2022', from: 'event_event_date_1i'
        select 'February', from: 'event_event_date_2i'
        select '2', from: 'event_event_date_3i'
        select '03', from: 'event_event_time_4i'
        select '45', from: 'event_event_time_5i'
        select 'Example', from: 'event_location_id'
        fill_in 'event_description', with: 'Discussing books'
        click_on 'Create Event'

        visit 'events'

        assert_text 'Party', count: 1
        assert_text 'Book Club', count: 1
    end
end
