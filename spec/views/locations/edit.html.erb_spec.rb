require 'rails_helper'

RSpec.describe "locations/edit", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      name: "MyString",
      description: "MyString",
      #type: 1,
      instructions: "MyString",
      address: "MyString"
    ))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(@location), "post" do

      assert_select "input[name=?]", "location[name]"

      assert_select "input[name=?]", "location[description]"

      #assert_select "input[name=?]", "location[type]"

      assert_select "input[name=?]", "location[instructions]"

      assert_select "input[name=?]", "location[address]"
    end
  end
end
