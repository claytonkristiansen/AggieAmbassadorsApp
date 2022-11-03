require 'rails_helper'

RSpec.describe('events/', type: :feature) do
    it 'Can unregister for an event' do
        # Sign in for testing, comment out if sign in not necessary
        #####################################################################################################
        admin = Admin.create!(email: 'fakeemail@tamu.edu', full_name: 'Example User', privilege_level: 20)
        allow_any_instance_of(Devise::Controllers::Helpers).to(receive(:admin_signed_in?).and_return(true))
        Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin]
        Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
        visit 'admins/sign_in'
        click_on 'Sign in with Google'
        #####################################################################################################

        # Creating test events
        test_event_1 = Event.create(title: 'test event 1', description: 'test event 1 description')
        test_event_2 = Event.create(title: 'test event 2', description: 'test event 2 description')
        test_event_3 = Event.create(title: 'test event 3', description: 'test event 3 description')

        # Creating attendance records to simulate the user having already signed up for events
        attendance_record_1 = AttendanceRecord.create(event_id: test_event_1.id, admin_id: admin.id)
        attendance_record_2 = AttendanceRecord.create(event_id: test_event_2.id, admin_id: admin.id)
        attendance_record_3 = AttendanceRecord.create(event_id: test_event_3.id, admin_id: admin.id)

        # Testing that registration records currently exist
        expect(AttendanceRecord.where(event_id: test_event_1.id, admin_id: admin.id)).to(exist)
        expect(AttendanceRecord.where(event_id: test_event_2.id, admin_id: admin.id)).to(exist)
        expect(AttendanceRecord.where(event_id: test_event_3.id, admin_id: admin.id)).to(exist)

        visit 'events/'

        # Testing that you can unregister for first event
        find('tr', text: 'test event 1').click_link('Unregister')
        click_on 'Confirm'
        expect(AttendanceRecord.where(event_id: test_event_1.id, admin_id: admin.id)).not_to(exist)

        # Testing that you can unregiser for second event
        find('tr', text: 'test event 2').click_link('Unregister')
        click_on 'Confirm'
        expect(AttendanceRecord.where(event_id: test_event_2.id, admin_id: admin.id)).not_to(exist)

        # Testing that you can unregiser for third event
        find('tr', text: 'test event 3').click_link('Unregister')
        click_on 'Confirm'
        expect(AttendanceRecord.where(event_id: test_event_3.id, admin_id: admin.id)).not_to(exist)
    end
end
