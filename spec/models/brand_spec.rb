require 'rails_helper'

RSpec.describe Brand, type: :model do
  context "testing factory" do
    it {expect(build(:brand)).to be_valid}
  end
  
  context "testing brand's name:" do
    it "name shouldn't be nil" do
      expect(build(:brand, name:nil)).to be_invalid
    end
  end
end
