require 'rails_helper'

RSpec.describe Purchase, type: :model do
  context 'testing factory' do
    it {expect(build(:purchase)).to be_valid}
  end
end
