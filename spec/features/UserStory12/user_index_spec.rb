require 'rails_helper'

RSpec.describe('members/index', type: :feature) do
    it 'Can Show the users' do
        # Create
        visit 'creating_new_user'
        fill_in 'member_email', with: 'email@email.com'
        fill_in 'member_preferred_name', with: 'Example User'
        click_on 'Create Member'

        # Create
        visit 'creating_new_user'
        fill_in 'member_email', with: 'email1@email.com'
        fill_in 'member_preferred_name', with: 'Example User'
        click_on 'Create Member'

        # Create
        visit 'creating_new_user'
        fill_in 'member_email', with: 'email2@email.com'
        fill_in 'member_preferred_name', with: 'Example User'
        click_on 'Create Member'

        # Sign in
        member = Member.create!(email: 'fakeemail@tamu.edu', full_name: 'Example User', privilege_level: 30)
        allow_any_instance_of(Devise::Controllers::Helpers).to(receive(:member_signed_in?).and_return(true))
        Rails.application.env_config['devise.mapping'] = Devise.mappings[:member]
        Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

        visit 'members/sign_in'
        click_on 'Sign in with Google'

        visit 'members'
        assert_text 'Example User', count: 4
    end

    it 'Unauthorized user can not see the users' do
        # Create
        visit 'creating_new_user'
        fill_in 'member_email', with: 'email@email.com'
        fill_in 'member_preferred_name', with: 'Example User'
        click_on 'Create Member'

        # Sign in
        member = Member.create!(email: 'fakeemail@tamu.edu', full_name: 'Example User', privilege_level: 10)
        allow_any_instance_of(Devise::Controllers::Helpers).to(receive(:member_signed_in?).and_return(true))
        Rails.application.env_config['devise.mapping'] = Devise.mappings[:member]
        Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

        visit 'members/sign_in'
        click_on 'Sign in with Google'

        visit 'members'
        assert_text 'Example User', count: 0
    end
end
