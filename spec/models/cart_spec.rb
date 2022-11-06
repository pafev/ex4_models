require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:user) {create(:user, email: "example@email")}
  context 'testing factory' do
    it {expect(build(:cart, user_id: user.id)).to be_valid}
  end
end
