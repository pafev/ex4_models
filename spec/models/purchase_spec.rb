require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:brand) {create(:brand)}
  let(:category) {create(:category)}
  let(:user) {create(:user)}
  let(:product) {create(:product, brand_id: brand.id, category_id: category.id)}
  let(:cart) {create(:cart, user_id: user.id)}
  context 'testing factory' do
    it {expect(build(:purchase, product_id: product.id, cart_id: cart.id)).to be_valid}
  end
end
