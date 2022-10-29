require 'rails_helper'

RSpec.describe User, type: :model do
  context "testing factory" do
    it {expect(build(:user)).to be_valid}
  end
end
