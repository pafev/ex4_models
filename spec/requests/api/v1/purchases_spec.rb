require 'rails_helper'

RSpec.describe "Api::V1::Purchases", type: :request do
  let(:user) {create(:user)}
  let(:authentication_params) {{
    'X-User-Email': user.email,
    'X-User-Token': user.authentication_token
    }}

  describe "GET /index" do
    context "cart exists" do
      let(:cart) {create(:cart, user_id: user.id)}
      before do
        get "/api/v1/purchases/index", headers: authentication_params
      end
      it "return http status ok" do
        expect(response).to have_http_status(:ok)
      end
      it "return a json" do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "GET /show" do
    context "purchase exists" do
      let(:cart) {create(:cart, user_id: user.id)}
      let(:purchase) {create(:purchase, cart_id: cart.id)}
      before do
        get "/api/v1/purchases/show/#{purchase.id}", headers: authentication_params
      end
      it "return http status ok" do
        expect(response).to have_http_status(:ok)
      end
      it "return a json" do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  
    context "purchase doesn't exist" do
      before do
        get "/api/v1/purchases/show/-1", headers: authentication_params
      end
      it "return http status not_found" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "POST /create" do
    context "cart exists and params are valids" do
      # let(:cart) {create(:cart, user_id: user.id)}
      let(:product) {create(:product)}
      before do
        Cart.create(user_id: user.id)
        post "/api/v1/purchases/create", params: {purchase: {product_id: product.id}}, headers: authentication_params
      end
      it "return a http status created" do
        expect(response).to have_http_status(:created)
      end
    end

    context "cart doesn't exist" do
      let(:product) {create(:product)}
      before do
        post "/api/v1/purchases/create", params: {purchase: {product_id: product.id}}, headers: authentication_params
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "params aren't valids" do
      let(:product) {create(:product)}
      before do
        Cart.create(user_id: user.id)
        post "/api/v1/purchases/create", params: nil, headers: authentication_params
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "DELETE /delete" do
    context "purchase exists and correct user is logged in" do
      let(:cart) {create(:cart, user_id: user.id)}
      let(:purchase) {create(:purchase, cart_id: cart.id)}
      before do
        delete "/api/v1/purchases/delete/#{purchase.id}", headers: authentication_params
      end
      it "return http status ok" do
        expect(response).to have_http_status(:ok)
      end
      it "remove instance correctly" do
        expect(Purchase.all.include?(purchase)).to be_falsey
      end
    end

    context "purchase doesn't exist" do
      let(:cart) {create(:cart, user_id: user.id)}
      let(:purchase) {create(:purchase, cart_id: cart.id)}
      before do
        delete "/api/v1/purchases/delete/-1", headers: authentication_params
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "incorrect user" do
      let(:user2) {create(:user, email: 'example2@email', name: 'batatinha')}
      let(:authentication_params2) {{
        'X-User-Email': user2.email,
        'X-User-Token': user2.authentication_token
        }}
      let(:cart) {create(:cart, user_id: user.id)}
      let(:purchase) {create(:purchase, cart_id: cart.id)}
      before do
        delete "/api/v1/purchases/delete/#{purchase.id}", headers: authentication_params2
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
