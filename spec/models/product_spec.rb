require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'testing factory' do
    it {expect(build(:product)).to be_valid}
  end

  context 'testing name:' do
    it "name shouldn't be nil" do
      expect(build(:product, name: nil)).to be_invalid
    end
    it "name should be uniq" do
      create(:product, name: 'aa')
      expect(build(:product, name: 'aa')).to be_invalid
    end
  end

  context 'testing price:' do
    it "price shouldn't be nil" do
      expect(build(:product, price: nil)).to be_invalid
    end
  end
  
  context 'testing stock_quantity' do
    it "stock_quantity shouldn't be nil" do
      expect(build(:product, stock_quantity: nil)).to be_invalid
    end
  end

  # context 'testing description' do
  #   it "description shouldn't be nil" do
  #     expect(build(:product, description: nil)).to be_invalid
  #   end
  # end
end
