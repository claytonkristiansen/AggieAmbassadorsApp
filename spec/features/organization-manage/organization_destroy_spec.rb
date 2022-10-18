require 'rails_helper'

RSpec.describe('organization/destroy', type: :feature) do
    it 'Delete an organization by authorized user' do
        test_email = 'fakeemail@tamu.edu'

        # create internal test admin account
        if Admin.where(email: test_email).first.nil?
            admin = Admin.create!(email: test_email, privilege_level: 30)
        else
            admin = Admin.where(email: test_email).first
            admin.privilege_level = 30
            admin.save
        end

        # allow authentication
        allow_any_instance_of(Devise::Controllers::Helpers).to(receive(:admin_signed_in?).and_return(true))
        Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin]
        Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
        visit 'admins/sign_in'
        click_on 'Sign in with Google'

        expect(page).to(have_content('Sign Out'))

        # go to organizations page
        visit '/organizations'
        expect(page).to(have_content('Organization Directory'))
        expect(page).to(have_content('Aggie'))

        # this must be present for the signed in admin
        expect(page).to(have_content('Add an organization'))
        expect(page).to(have_content('Sign Out'))

        click_on 'Add an organization'

        expect(page).to(have_content('New Organization'))
        expect(page).to(have_content('Sign Out'))
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

        # trigger delete option
        expect(page).to(have_content('Remove this organization from the directory'))
        click_on 'Remove this organization from the directory'

        # at this point redirected to the confirm page
        expect(page).to(have_content('Destroy the Orgnization'))
        expect(page).to(have_content('Are you sure?'))
        expect(page).to(have_content(@organization.name))

        click_on 'Delete'

        # at this point back at directory page
        expect(page).to(have_content('Organization was successfully destroyed.'))
        expect(page).not_to(have_content(@organization.name))
    end
end
