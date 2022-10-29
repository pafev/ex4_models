require 'rails_helper'

RSpec.describe User, type: :model do
  context "testing factory" do
    it {expect(build(:user)).to be_valid}
  end

  context "testing name" do
    it "name shouldn't be nil" do
      expect(build(:user, name: nil)).to be_invalid
    end
    it "name should be uniq" do
      create(:user, name: 'aa')
      expect(build(:user, name: 'aa')).to be_invalid
    end
  end
end
