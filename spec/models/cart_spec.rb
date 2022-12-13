require 'rails_helper'

RSpec.describe Cart, type: :model do
  context 'testing factory' do
    it {expect(build(:cart)).to be_valid}
  end
end
