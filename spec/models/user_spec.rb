require 'rails_helper'

RSpec.describe User, type: :model do
  context "testing factory" do
    it { expect(build(:user, email: "teste@teste")).to be_valid }
  end

  context "testing name" do
    it "name shouldn't be nil" do
      expect(build(:user, name: nil, email: "teste@teste")).to be_invalid
    end
    it "name should be uniq" do
      create(:user, name: 'aa', email: "teste@teste")
      expect(build(:user, name: 'aa', email: "teste2@teste")).to be_invalid
    end
  end

  context "testing email" do
    it "email shouldn't be nil" do
      expect(build(:user, email: nil)).to be_invalid
    end
    it "email should be uniq" do
      create(:user, name: 'aa', email:'example@email')
      expect(build(:user, name: 'bb', email:'example@email')).to be_invalid
    end
  end

  context "testing password" do
    it "password shouldn't be nil" do
      expect(build(:user, password: nil, email: "teste@teste")).to be_invalid
    end
  end

  context "trait :admin is ok" do
     it {expect(build(:user, :admin, email: "teste@email").is_admin).to eq(true)}
  end
end
