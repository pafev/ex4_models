require 'rails_helper'

RSpec.describe Category, type: :model do
  context "testing factory" do
    it {expect(build(:category)).to be_valid}
  end

  context "testing name:" do
    it "name shouldn't be nil" do
      expect(build(:category, name: nil)).to be_invalid
    end
    it "name should be uniq" do
      create(:category, name: 'aa')
      expect(build(:category, name: 'aa')).to be_invalid
    end
  end
end
