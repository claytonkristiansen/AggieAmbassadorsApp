require 'rails_helper'

RSpec.describe('members/index', type: :view) do
    it 'shows members list to authorized members' do
        # Create
        visit 'creating_new_user'
        fill_in 'member_email', with: 'email@email.com'
        click_on 'Create Member'

        # Create
        visit 'creating_new_user'
        fill_in 'member_email', with: 'email1@email.com'
        click_on 'Create Member'

        # Create
        visit 'creating_new_user'
        fill_in 'member_email', with: 'email2@email.com'
        click_on 'Create Member'

        # Sign in
        member = Member.create!(email: 'fakeemail@tamu.edu', full_name: 'Example User', privilege_level: 30)
        allow_any_instance_of(Devise::Controllers::Helpers).to(receive(:member_signed_in?).and_return(true))
        Rails.application.env_config['devise.mapping'] = Devise.mappings[:member]
        Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

        visit 'members/sign_in'
        click_on 'Sign in with Google'

        visit 'members'
        assert_text 'email@email.com', count: 1
        assert_text 'email1@email.com', count: 1
        assert_text 'email2@email.com', count: 1
        assert_text 'fakeemail@tamu.edu', count: 1
    end

    it 'does not show member list to unauthorized members' do
        # Create
        visit 'creating_new_user'
        fill_in 'member_email', with: 'email@email.com'
        click_on 'Create Member'

        # Sign in
        member = Member.create!(email: 'fakeemail@tamu.edu', full_name: 'Example User', privilege_level: 10)
        allow_any_instance_of(Devise::Controllers::Helpers).to(receive(:member_signed_in?).and_return(true))
        Rails.application.env_config['devise.mapping'] = Devise.mappings[:member]
        Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

        visit 'members/sign_in'
        click_on 'Sign in with Google'

        visit 'members'
        assert_text 'email@email.com', count: 0
        assert_text 'fakeemail@tamu.edu', count: 0
    end
end
