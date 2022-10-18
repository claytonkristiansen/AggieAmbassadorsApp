require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject do
        described_class.new(email: 'email@email')
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end
end

