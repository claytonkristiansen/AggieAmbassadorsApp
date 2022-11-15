require 'rails_helper'

RSpec.describe('locations/show', type: :view) do
    before do
        @location = assign(:location, Location.create!(
                                          name: 'Name',
                                          description: 'Description',
                                          # type: 2,
                                          instructions: 'Instructions',
                                          address: 'Address'
                                      )
        )
    end

    it 'renders attributes in <p>' do
        render
        expect(rendered).to(match(/Name/))
        expect(rendered).to(match(/Description/))
        # expect(rendered).to match(/2/)
        expect(rendered).to(match(/Instructions/))
        expect(rendered).to(match(/Address/))
    end
end
