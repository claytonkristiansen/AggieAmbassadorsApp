require 'rails_helper'

RSpec.describe('member/edit', type: :view) do
    it 'edits a member' do
        sign_in_test_account!

        visit 'members'
        assert_text 'fakeemail@tamu.edu'
        click_on 'Example User'

        assert_text 'Account'
        assert_text 'fakeemail@tamu.edu'
        assert_text 'Edit account'
        click_on 'Edit account'

        fill_in 'member_preferred_name', with: 'John'
        click_on 'Update Member'

        click_on 'My Account'

        assert_text 'John'
    end
end
