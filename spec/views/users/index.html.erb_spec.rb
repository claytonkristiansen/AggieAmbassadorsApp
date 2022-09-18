require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        first_name: "First Name",
        last_name: "Last Name",
        email: "Email",
        session_key: "Session Key",
        account_type: "Account Type"
      ),
      User.create!(
        first_name: "First Name",
        last_name: "Last Name",
        email: "Email",
        session_key: "Session Key",
        account_type: "Account Type"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Session Key".to_s, count: 2
    assert_select "tr>td", text: "Account Type".to_s, count: 2
  end
end
