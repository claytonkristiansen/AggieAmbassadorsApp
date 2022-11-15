require 'rails_helper'

RSpec.describe('events/', type: :feature) do
    it 'Can unregister for an event' do
        # Sign in for testing, comment out if sign in not necessary
        #####################################################################################################
        member = Member.create!(email: 'fakeemail@tamu.edu', full_name: 'Example User', privilege_level: 20)
        allow_any_instance_of(Devise::Controllers::Helpers).to(receive(:member_signed_in?).and_return(true))
        Rails.application.env_config['devise.mapping'] = Devise.mappings[:member]
        Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
        visit 'members/sign_in'
        click_on 'Sign in with Google'
        #####################################################################################################

        # Creating test events
        Location.create!([{name: 'Example'}])

        test_event_1 = Event.create(title: 'test event 1', description: 'test event 1 description', location_id: 1)
        test_event_2 = Event.create(title: 'test event 2', description: 'test event 2 description', location_id: 1)
        test_event_3 = Event.create(title: 'test event 3', description: 'test event 3 description', location_id: 1)

        # Creating attendance records to simulate the user having already signed up for events
        attendance_record_1 = AttendanceRecord.create(event_id: test_event_1.id, member_id: member.id)
        attendance_record_2 = AttendanceRecord.create(event_id: test_event_2.id, member_id: member.id)
        attendance_record_3 = AttendanceRecord.create(event_id: test_event_3.id, member_id: member.id)

        # Testing that registration records currently exist
        expect(AttendanceRecord.where(event_id: test_event_1.id, member_id: member.id)).to(exist)
        expect(AttendanceRecord.where(event_id: test_event_2.id, member_id: member.id)).to(exist)
        expect(AttendanceRecord.where(event_id: test_event_3.id, member_id: member.id)).to(exist)

        visit 'events/'

        # Testing that you can unregister for first event
        find('div', class: 'card', text: 'test event 1').click_link('Unregister')
        click_on 'Confirm'
        expect(AttendanceRecord.where(event_id: test_event_1.id, member_id: member.id)).not_to(exist)

        # Testing that you can unregiser for second event
        find('div', class: 'card', text: 'test event 2').click_link('Unregister')
        click_on 'Confirm'
        expect(AttendanceRecord.where(event_id: test_event_2.id, member_id: member.id)).not_to(exist)

        # Testing that you can unregiser for third event
        find('div', class: 'card', text: 'test event 3').click_link('Unregister')
        click_on 'Confirm'
        expect(AttendanceRecord.where(event_id: test_event_3.id, member_id: member.id)).not_to(exist)
    end
end
