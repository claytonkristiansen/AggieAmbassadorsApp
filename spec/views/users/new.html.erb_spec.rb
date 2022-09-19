require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      auth_id: "MyString",
      position_title: "MyString",
      priviledged: false,
      preferred_name: "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[auth_id]"

      assert_select "input[name=?]", "user[position_title]"

      assert_select "input[name=?]", "user[priviledged]"

      assert_select "input[name=?]", "user[preferred_name]"
    end
  end
end
