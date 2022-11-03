require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:brand) {create(:brand)}
  let(:category) {create(:category)}
  context 'testing factory' do
    it {expect(build(:product, brand_id: brand.id, category_id: category.id))}
  end
  context 'testing name:' do
    it "name shouldn't be nil" do
      expect(build(:product, brand_id: brand.id, category_id: category.id, name: nil)).to be_invalid
    end
    it "name should be uniq" do
      create(:product, brand_id: brand.id, category_id: category.id, name: 'aa')
      expect(build(:product, brand_id: brand.id, category_id: category.id, name: 'aa')).to be_invalid
    end
  end
  context 'testing price:' do
    it "price shouldn't be nil" do
      expect(build(:product, brand_id: brand.id, category_id: category.id, price: nil)).to be_invalid
    end
  end
  context 'testing stock_quantity' do
    it "stock_quantity shouldn't be nil" do
      expect(build(:product, brand_id: brand.id, category_id: category.id, stock_quantity: nil)).to be_invalid
    end
  end
end
