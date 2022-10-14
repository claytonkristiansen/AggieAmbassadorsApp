require 'rails_helper'

RSpec.describe "organizations/edit", type: :view do
  before(:each) do
    @organization = assign(:organization, Organization.create!(
      name: "MyString",
      contact_name: "MyString",
      contact_email: "MyString",
      contact_phone: "MyString",
      contact_title: "MyString"
    ))
  end

  it "renders the edit organization form" do
    render

    assert_select "form[action=?][method=?]", organization_path(@organization), "post" do

      assert_select "input[name=?]", "organization[name]"

      assert_select "input[name=?]", "organization[contact_name]"

      assert_select "input[name=?]", "organization[contact_email]"

      assert_select "input[name=?]", "organization[contact_phone]"

      assert_select "input[name=?]", "organization[contact_title]"
    end
  end
end
