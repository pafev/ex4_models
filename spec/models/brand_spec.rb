require 'rails_helper'

RSpec.describe Brand, type: :model do
  context "Testing name:" do
    it "name shouldn't be nil" do
      expect(build(:brand, name: nil)).to be_invalid
    end
  end
end
