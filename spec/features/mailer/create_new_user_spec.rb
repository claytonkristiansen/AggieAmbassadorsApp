require 'rails_helper'

RSpec.describe('members/new', type: :feature) do
    #     it 'Will send email when user is created' do
    #         visit 'creating_new_user'
    #         fill_in 'member_email', with: 'email@email.com'
    #         fill_in 'member_preferred_name', with: 'example user'
    #         find("label[for='member_send_emails']").click
    #         click_on 'Create Member'

    #         expect(ActionMailer::Base.deliveries).not_to be_empty
    #     end

    it 'Will not send email when user is created' do
        visit 'creating_new_user'
        fill_in 'member_email', with: 'email@email.com'
        fill_in 'member_preferred_name', with: 'example user'
        click_on 'Create Member'

        expect(ActionMailer::Base.deliveries).to(be_empty)
    end
end
