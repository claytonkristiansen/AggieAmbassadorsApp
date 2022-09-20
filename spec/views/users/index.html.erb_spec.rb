require 'rails_helper'

# RSpec.describe "users/index", type: :view do
#   before(:each) do
#     assign(:users, [
#       User.create!(
#         auth_id: "Auth",
#         position_title: "Position Title",
#         priviledged: false,
#         preferred_name: "Preferred Name"
#       ),
#       User.create!(
#         auth_id: "Auth",
#         position_title: "Position Title",
#         priviledged: false,
#         preferred_name: "Preferred Name"
#       )
#     ])
#   end

#   it "renders a list of users" do
#     render
#     assert_select "tr>td", text: "Auth".to_s, count: 2
#     assert_select "tr>td", text: "Position Title".to_s, count: 2
#     assert_select "tr>td", text: false.to_s, count: 2
#     assert_select "tr>td", text: "Preferred Name".to_s, count: 2
#   end
# end
