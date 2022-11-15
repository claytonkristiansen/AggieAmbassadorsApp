require 'rails_helper'

RSpec.describe "locations/new", type: :view do
  before(:each) do
    assign(:location, Location.new(
      name: "MyString",
      description: "MyString",
      #type: 1,
      instructions: "MyString",
      address: "MyString"
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input[name=?]", "location[name]"

      assert_select "input[name=?]", "location[description]"

      #assert_select "input[name=?]", "location[type]"

      assert_select "input[name=?]", "location[instructions]"

      assert_select "input[name=?]", "location[address]"
    end
  end
end
