require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      auth_id: "Auth",
      position_title: "Position Title",
      priviledged: false,
      preferred_name: "Preferred Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Auth/)
    expect(rendered).to match(/Position Title/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Preferred Name/)
  end
end
