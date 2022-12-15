require 'rails_helper'

RSpec.describe Address, type: :model do
  context "testing factory" do
    it {expect(build(:address)).to be_valid}
  end
  context "testing description" do
    it "description shouldn't be nil" do
      expect(build(:address, description: nil)).to be_invalid
    end
  end
end
