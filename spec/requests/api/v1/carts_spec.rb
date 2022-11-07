require 'rails_helper'

RSpec.describe "Api::V1::Carts", type: :request do
  let(:user) {create(:user, :admin)}
  let(:authentication_params) {{
    'X-User-Email': user.email, 
    'X-User-Token': user.authentication_token
    }
  }
  describe "POST /create" do
    context "params are ok" do
      it "return http status created" do
        post "/api/v1/carts/create", params: {cart: {user_id: user.id}}, headers: authentication_params
        expect(response).to have_http_status(:created)
      end
    end
    context "params aren't ok" do
      it "return http status bad_request" do
        post "/api/v1/carts/create", params: nil, headers: authentication_params
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "DELETE /delete" do
    context "id exists" do
    let(:cart) {create(:cart, user_id: user.id)}
      before do 
        delete "/api/v1/carts/delete/#{cart.id}", headers: authentication_params
      end
      it "return http status ok" do
        expect(response).to have_http_status(:ok)
      end
      it "remove the instance correctly" do
        delete "/api/v1/carts/delete/#{cart.id}", headers: authentication_params
        expect(response).to have_http_status(:not_found)
      end
    end
    context "id doesn't exist" do
      it "return http status not_found" do
        delete "/api/v1/carts/delete/-1", headers: authentication_params
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
