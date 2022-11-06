require 'rails_helper'

RSpec.describe "Api::V1::Carts", type: :request do
  describe "POST /create" do
    context "params are ok" do
      let(:user) {create(:user, email:"example@email")}
      it "return http status created" do
        post "/api/v1/carts/create", params: {cart: {user_id: user.id}}
        expect(response).to have_http_status(:created)
      end
    end
    context "params aren't ok" do
      it "return http status bad_request" do
        post "/api/v1/carts/create", params: nil
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
