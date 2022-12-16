require 'rails_helper'

RSpec.describe "Api::V1::Brands", type: :request do
  let(:user_admin) {create(:user, :admin)}
  let(:authentication_params_admin) {{
    'X-User-Email': user_admin.email, 
    'X-User-Token': user_admin.authentication_token
    }
  }
  let(:user) {create(:user)}
  let(:authentication_params) {{
    'X-User-Email': user.email, 
    'X-User-Token': user.authentication_token
    }
  }

  describe "GET /index" do
    before do
      create(:brand, id: 1, name: 'Pandora')
      create(:brand, id: 2, name: 'Pollo')
      get "/api/v1/brands/index"
    end

    context "return http status ok" do
      it {expect(response).to have_http_status(:ok)}
    end

    context "return a json" do
      it {expect(response.content_type).to eq('application/json; charset=utf-8')}
    end

    context "return the created instances" do
      it {expect(response.body).to eq([
        {id: 1, name: 'Pandora', logo_url: nil},
        {id: 2, name: 'Pollo', logo_url: nil}
      ].to_json)}
    end
  end

  describe "GET /show" do
    let(:brand) {create(:brand, id: 1, name: 'Lacoste')}

    context "id exists" do
      before do
        get "/api/v1/brands/show/#{brand.id}"
      end
      it "return http status ok" do
        expect(response).to have_http_status(:ok)
      end
      it "return a json" do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
      it "return the correct instance" do
        expect(response.body). to eq({id: 1, name: 'Lacoste', logo_url: nil}.to_json)
      end
    end
  
    context "id doesn't exist" do
      before do
        get "/api/v1/brands/show/-1"
      end
      it "return http status not_found" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "POST /create" do
    let(:brand_params) {attributes_for(:brand)}

    context "params are ok and user is admin" do
      before do
        post "/api/v1/brands/create", params: {brand: brand_params}, headers: authentication_params_admin
      end
      it "return http status created" do
        expect(response).to have_http_status(:created)
      end
    end
  
    context "params aren't ok" do
      before do
        post "/api/v1/brands/create", params: {brand: nil}, headers: authentication_params_admin
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "user isn't admin" do
      before do
        post "/api/v1/brands/create", params: {brand: brand_params}, headers: authentication_params
      end
      it "return http status unauthorized" do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "PATCH /update" do
    let(:brand) {create(:brand)}
  
    context "when id exists, params are ok and user is admin" do
      before do
        patch "/api/v1/brands/update/#{brand.id}", params: {brand: {name: 'Pollo'}}, headers: authentication_params_admin
      end
      it "return http status ok" do
        expect(response).to have_http_status(:ok)
      end
      it "updated correctly" do
        expect(Brand.find(brand.id).name).to eq('Pollo')
      end
    end
  
    context "when params aren't ok" do
      before do
        patch "/api/v1/brands/update/#{brand.id}", params: {brand: nil}, headers: authentication_params_admin
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end
  
    context "when id doesn't exists" do
      before do
        patch "/api/v1/brands/update/-1", params: {brand: {name: 'Pollo'}}, headers: authentication_params_admin
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end
  
    context "when user isn't admin" do
      before do
        patch "/api/v1/brands/update/#{brand.id}", params: {brand: {name: 'Pollo'}}, headers: authentication_params
      end
      it "return http status unauthorized" do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "DELETE /delete" do
    let(:brand) {create(:brand)}
  
    context "id exists and user is admin" do
      before do
        delete "/api/v1/brands/delete/#{brand.id}", headers: authentication_params_admin
      end
      it "return http status ok" do
        expect(response).to have_http_status(:ok)
      end
      it "delete instance correctly" do
        expect(Brand.all.include?(brand)).to be_falsey
      end
    end
  
    context "id doesn't exist" do
      before do
        delete "/api/v1/brands/delete/-1", headers: authentication_params_admin
      end
      it "return http status not_found" do
        expect(response).to have_http_status(:not_found)
      end
    end

    context "user isn't admin" do
      before do
        delete "/api/v1/brands/delete/#{brand.id}", headers: authentication_params
      end
      it "return http status unauthorized" do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end