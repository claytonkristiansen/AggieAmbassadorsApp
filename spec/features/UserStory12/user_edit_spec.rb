require 'rails_helper'

RSpec.describe('member/create', type: :view) do
    it 'Edit users' do
        # Create
        visit 'creating_new_user'
        fill_in 'member_email', with: 'email@email.com'
        fill_in 'member_preferred_name', with: 'Example User'
        click_on 'Create Member'

        member = Member.create!(email: 'fakeemail@tamu.edu', full_name: 'Example User', privilege_level: 30)
        allow_any_instance_of(Devise::Controllers::Helpers).to(receive(:member_signed_in?).and_return(true))
        Rails.application.env_config['devise.mapping'] = Devise.mappings[:member]
        Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

        visit 'members/sign_in'
        click_on 'Sign in with Google'

        visit 'members'
        assert_text '20', count: 0
        assert_text 'Project Tester', count: 0

        first(:link, 'Edit').click
        select 'Event Creator', from: 'member_privilege_level'
        fill_in 'member_position_title', with: 'Project Tester'
        click_on 'Update Member'

        assert_text '20', count: 1
        assert_text 'Project Tester', count: 1
    end
end
