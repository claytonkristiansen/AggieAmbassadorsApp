require 'rails_helper'

RSpec.describe('event/edit', type: :feature) do
    it 'is able to edit an event' do
        sign_in_test_account!

        visit 'events/new'
        fill_in 'event_title', with: 'Party'
        # select '2022', from: 'event_event_date_1i'
        # select 'January', from: 'event_event_date_2i'
        # select '1', from: 'event_event_date_3i'
        # select '02', from: 'event_event_time_4i'
        # select '30', from: 'event_event_time_5i'
        fill_in 'event_location', with: 'My house'
        fill_in 'event_description', with: 'House party'
        click_on 'Create Event'

        visit 'events'

        click_on 'Edit'

        fill_in 'event_title', with: 'Book Club'
        # select '2022', from: 'event_event_date_1i'
        # select 'February', from: 'event_event_date_2i'
        # select '2', from: 'event_event_date_3i'
        # select '03', from: 'event_event_time_4i'
        # select '45', from: 'event_event_time_5i'
        fill_in 'event_location', with: 'Library'
        fill_in 'event_description', with: 'Discussing books'
        click_on 'Update Event'

        # new values
        assert_text 'Party', count: 0
        # assert_text '2022-01-01', count: 0
        # assert_text '02:30:00', count: 0
        assert_text 'My house', count: 0
        assert_text 'House party', count: 0
        assert_text 'Book Club', count: 1
        # assert_text '2022-02-02', count: 1
        # assert_text '03:45:00', count: 1
        assert_text 'Library', count: 1
        assert_text 'Discussing books', count: 1
    end
end
