require 'rails_helper'

RSpec.describe('organization/edit', type: :feature) do
    it 'Edit an organization by authorized user' do
        test_email = 'fakeemail@tamu.edu'

        # create internal test member account
        if Member.where(email: test_email).first.nil?
            member = Member.create!(email: test_email, privilege_level: 30)
        else
            member = Member.where(email: test_email).first
            member.privilege_level = 30
            member.save
        end

        # allow authentication
        allow_any_instance_of(Devise::Controllers::Helpers).to(receive(:member_signed_in?).and_return(true))
        Rails.application.env_config['devise.mapping'] = Devise.mappings[:member]
        Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
        visit 'members/sign_in'
        click_on 'Sign in with Google'

        # expect(page).to(have_content('Sign Out'))

        # go to organizations page
        visit '/organizations'
        expect(page).to(have_content('Organization Directory'))
        expect(page).to(have_content('Aggie'))

        # this must be present for the signed in member
        expect(page).to(have_content('Add an organization'))
        # expect(page).to(have_content('Sign Out'))

        click_on 'Add an organization'

        expect(page).to(have_content('New Organization'))
        # expect(page).to(have_content('Sign Out'))
        expect(page).to(have_content('Back'))

        # fill sample entry in form
        fill_in 'organization_name', with: 'Test Example 1'
        fill_in 'organization_contact_name', with: 'John Smith'
        fill_in 'organization_contact_email', with: 'john@smith.com'
        fill_in 'organization_contact_phone', with: '123456789'
        fill_in 'organization_contact_title', with: 'President'

        click_on 'Create Organization'

        # check db for entry that was created
        @organization = Organization.where(
            name: 'Test Example 1',
            contact_name: 'John Smith',
            contact_email: 'john@smith.com',
            contact_phone: '123456789',
            contact_title: 'President'
        ).first
        expect(@organization).to(be_valid)

        expect(page).to(have_content('Organization was successfully created.'))

        # check if details were retrived properly
        expect(page).to(have_content(@organization.name))
        expect(page).to(have_content(@organization.contact_name))
        expect(page).to(have_content(@organization.contact_email))
        expect(page).to(have_content(@organization.contact_phone))
        expect(page).to(have_content(@organization.contact_title))

        # trigger edit option
        # expect(page).to(have_content("Edit this organization's information"))
        # click_on "Edit this organization's information"

        visit edit_organization_path(id: @organization.id)

        # at this point redirected to the edit page
        expect(page).to(have_content('Editing Organization'))

        # fill in different sample info
        fill_in 'organization_name', with: 'Test Example 2'
        fill_in 'organization_contact_name', with: 'John Doe'
        fill_in 'organization_contact_email', with: 'john@doe.com'
        fill_in 'organization_contact_phone', with: '987654321'
        fill_in 'organization_contact_title', with: 'Member'

        # submit changes
        click_on 'Update Organization'

        # the page should now be the show page and have the banner
        expect(page).to(have_content('Organization was successfully updated.'))

        # check that the new show values are the edited values
        expect(page).to(have_content('Test Example 2'))
        expect(page).to(have_content('John Doe'))
        expect(page).to(have_content('john@doe.com'))
        expect(page).to(have_content('987654321'))
        expect(page).to(have_content('Member'))
    end
end
