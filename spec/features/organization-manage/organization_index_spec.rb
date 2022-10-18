require 'rails_helper'

RSpec.describe 'organizations/index', type: :feature do

  it 'View all organizations by authorized admin' do

    test_email = 'fakeemail@tamu.edu'

    # create internal test admin account
    if Admin.where(email: test_email).first == nil
      admin = Admin.create!(email: test_email, privilege_level: 30)
    else
      admin = Admin.where(email: test_email).first
      admin.privilege_level = 30
      admin.save
    end

    # allow authentication
    allow_any_instance_of(Devise::Controllers::Helpers).to receive(:admin_signed_in?).and_return(true)
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    visit 'admins/sign_in'
    click_on 'Sign in with Google'

    expect(page).to have_content('Sign Out')

    # create sample organizations in db
    Organization.create!(
        name: 'Test Example 1',
        contact_name: 'John Smith',
        contact_email: 'john@smith.com',
        contact_phone: '123456789',
        contact_title: 'President'
    )
    Organization.create!(
        name: 'Test Example 2',
        contact_name: 'John Doe',
        contact_email: 'john@doe.com',
        contact_phone: '567891234',
        contact_title: 'Vice President'
    )

    # go to organizations page
    visit '/organizations'
    expect(page).to have_content('Organization Directory')
    expect(page).to have_content('Aggie')

    # this must be present for the signed in admin
    expect(page).to have_content('Add an organization')
    expect(page).to have_content('Sign Out')

    # check if both organizations are there
    expect(page).to have_content('Test Example 1')
    expect(page).to have_content('Test Example 2')

  end

end
