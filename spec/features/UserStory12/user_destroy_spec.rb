require 'rails_helper'

RSpec.describe('member/destroy', type: :feature) do
    it 'deletes a member' do
        visit 'creating_new_user'
        fill_in 'member_email', with: 'email1@email.com'
        click_on 'Create Member'

        sign_in_test_account!

        visit 'members'

        click_on 'email1@email.com'

        assert_text 'Account'
        assert_text 'email1@email.com'

        click_on 'Delete account'
        click_on 'Delete'

        assert_text 'Member was successfully destroyed.'
        assert_text 'email1@email.com', count: 0
    end
end
