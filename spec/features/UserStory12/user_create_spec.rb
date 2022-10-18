require 'rails_helper'

RSpec.describe "admins/new", type: :feature do

  it "Can create a new user" do
    visit "creating_new_user"
    fill_in 'admin_email', with: 'email@email.com'
    fill_in 'admin_preferred_name', with: 'example user'
    click_on 'Create Admin'

    @admin = Admin.where(email: 'email@email.com', preferred_name: 'example user', send_emails: false, privilege_level: 10, position_title: "Member").first

    expect(@admin).to be_valid
  end

end
