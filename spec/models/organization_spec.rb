require 'rails_helper'

RSpec.describe Organization, type: :model do
    subject do
        described_class.new(name: 'McDonalds')
    end
    
    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end
end