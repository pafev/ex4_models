require 'rails_helper'

RSpec.describe "Api::V1::Carts", type: :request do
  let(:user_admin) {create(:user, :admin)}
  let(:authentication_params_admin) {{
    'X-User-Email': user_admin.email, 
    'X-User-Token': user_admin.authentication_token
    }}

  let(:user) {create(:user, email: 'example2@email', name: 'batatinha')}
  let(:authentication_params) {{
    'X-User-Email': user.email, 
    'X-User-Token': user.authentication_token
    }
  }

  describe "POST /create" do
    context "params are ok and user is admin" do
      it "return http status created" do
        post "/api/v1/carts/create", params: {cart: {user_id: user.id}}, headers: authentication_params_admin
        expect(response).to have_http_status(:created)
      end
    end

    context "params aren't ok" do
      it "return http status bad_request" do
        post "/api/v1/carts/create", params: nil, headers: authentication_params_admin
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "user isn't admin" do
      it "return http status unauthorized" do
        post "/api/v1/carts/create", params: {cart: {cart_id: user.id}}, headers: authentication_params
      end
    end
  end

  describe "DELETE /delete" do
    let(:cart) {create(:cart, user_id: user.id)}
    context "id exists and user is admin" do
      before do 
        delete "/api/v1/carts/delete/#{cart.id}", headers: authentication_params_admin
      end
      it "return http status ok" do
        expect(response).to have_http_status(:ok)
      end
      it "remove the instance correctly" do
        expect(Cart.all.include?(cart.id)).to be_falsey
      end
    end

    context "id doesn't exist" do
      it "return http status not_found" do
        delete "/api/v1/carts/delete/-1", headers: authentication_params_admin
        expect(response).to have_http_status(:not_found)
      end
    end

    context "user isn't admin" do
      it "return http status unauthorized" do
        delete "/api/v1/carts/delete/#{cart.id}", headers: authentication_params
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "GET /view" do
    let(:cart) {create(:cart, user_id: user.id)}
    before do
      get "/api/v1/carts/view", headers: authentication_params
    end
  
    context "return http status ok" do
      it {expect(response).to have_http_status(:ok)}
    end
  
    context "return a json" do
      it {expect(response.content_type).to eq('application/json; charset=utf-8')}
    end

    # context "return the correct instance" do
    #   # before do
    #   #   p user.cart
    #   #   p cart
    #   #   p user
    #   # end
    #   it {expect(response.body).to eq({
    #     id: cart.id,
    #     total_value: cart.total_value,
    #     user: {
    #       id: user.id,
    #       name: user.name,
    #       email: user.email,
    #       is_admin: user.is_admin,
    #       credit_wallet: user.credit_wallet
    #     }
    #   }.to_json)}
    # end
  end
end
