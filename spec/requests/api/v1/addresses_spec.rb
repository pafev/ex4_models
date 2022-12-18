require 'rails_helper'

RSpec.describe "Api::V1::Addresses", type: :request do
  let(:user) {create(:user)}
  let(:authentication_params) {{
    'X-User-Email': user.email,
    'X-User-Token': user.authentication_token
    }}

  describe "GET /index" do
    before do
      get "/api/v1/addresses/index", headers: authentication_params
    end
    context "return http status ok" do
        it {expect(response).to have_http_status(:ok)}
    end
    context "return a json" do
        it {expect(response.content_type).to eq('application/json; charset=utf-8')}
    end
  end

  describe "PATCH /update" do
    context "address exists and params are valids" do
      let(:address) {create(:address, user_id: user.id)}
      before do
        patch "/api/v1/addresses/update/#{address.id}", params: {address: {description: 'brasília'}}, headers: authentication_params
      end
      it "return a http status ok" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "params aren't valids" do
      let(:address) {create(:address, user_id: user.id)}
      before do
        patch "/api/v1/addresses/update/#{address.id}", params: nil, headers: authentication_params
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "address doesn't exist" do
      before do
        patch "/api/v1/addresses/update/-1", params: {address: {description: 'brasília'}}, headers: authentication_params
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "POST /create" do
    context "params are valids" do
      before do
        post "/api/v1/addresses/create", params: {address: {description: 'brasília'}}, headers: authentication_params
      end
      it "return a http status created" do
        expect(response).to have_http_status(:created)
      end
    end

    context "params aren't valids" do
      before do
        post "/api/v1/addresses/create", params: nil, headers: authentication_params
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "DELETE /delete" do
    context "address exists and correct user is logged in" do
      let(:address) {create(:address, user_id: user.id)}
      before do
        delete "/api/v1/addresses/delete/#{address.id}", headers: authentication_params
      end
      it "return http status ok" do
        expect(response).to have_http_status(:ok)
      end
      it "remove instance correctly" do
        expect(Address.all.include?(address)).to be_falsey
      end
    end

    context "purchase doesn't exist" do
      let(:address) {create(:address, user_id: user.id)}
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
      let(:address) {create(:address, user_id: user.id)}
      before do
        delete "/api/v1/purchases/delete/#{address.id}", headers: authentication_params2
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
