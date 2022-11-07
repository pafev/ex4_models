require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  let(:user) {create(:user, password: 'batata')}
  describe "GET /login" do
    context "when params are ok and valids" do
      it "return http status ok" do
        get "/api/v1/users/login", params: {email: user.email, password: 'batata'}
        expect(response).to have_http_status(:ok)
      end
    end
    context "when params are ok, but invalids" do
      it "return http status unauthorized" do
        get "/api/v1/users/login", params: {email: user.email, password: 'batata2'}
        expect(response).to have_http_status(:unauthorized)
      end
    end
    context "when params aren't ok" do
      it "return http status bad_request" do
        get "/api/v1/users/login", params: nil
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
