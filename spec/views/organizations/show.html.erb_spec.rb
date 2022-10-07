require 'rails_helper'

RSpec.describe "organizations/show", type: :view do
  before(:each) do
    @organization = assign(:organization, Organization.create!(
      name: "Name",
      contact_name: "Contact Name",
      contact_email: "Contact Email",
      contact_phone: "Contact Phone",
      contact_title: "Contact Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Contact Name/)
    expect(rendered).to match(/Contact Email/)
    expect(rendered).to match(/Contact Phone/)
    expect(rendered).to match(/Contact Title/)
  end
end
