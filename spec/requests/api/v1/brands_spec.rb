require 'rails_helper'

RSpec.describe "Api::V1::Brands", type: :request do
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
      it {expect(response.body).to eq(Brand.all.to_json)}
    end
  end

  describe "GET /show" do
    let(:brand) {create(:brand)}
    context "id exists" do
      before do
        get "/api/v1/brands/show/#{brand.id}"
      end
      it "return http status ok" do
        expect(response).to have_http_status(:ok)
      end
      it "return the correct instance" do
        expect(response.body). to eq(brand.to_json)
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
    context "params are ok" do
      before do
        post "/api/v1/brands/create", params: {brand: brand_params}
      end
      it "return http status created" do
        expect(response).to have_http_status(:created)
      end
      it "brand should be uniq" do
        post "/api/v1/brands/create", params: {brand: brand_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
    context "params aren't ok" do
      brand_params = nil
      before do
        post "/api/v1/brands/create", params: {brand: brand_params}
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "PATCH /update" do
    let(:brand) {create(:brand)}
    let(:brand2) {create(:brand, name: 'Gucci')}
    context "id exists and params are ok" do
      it "return http status ok" do
        patch "/api/v1/brands/update/#{brand.id}", params: {brand: {name: 'Pollo'}}
        expect(response).to have_http_status(:ok)
      end
      it "brand should be uniq" do
        patch "/api/v1/brands/update/#{brand.id}", params: {brand: {name: brand2.name}}
        expect(response).to have_http_status(:bad_request)
      end
    end
    context "id exists and params aren't ok" do
      before do
        patch "/api/v1/brands/update/#{brand.id}", params: {brand: {name: nil}}
      end
      it "brand's name shouldn't be nil" do
        expect(response).to have_http_status(:bad_request)
      end
    end
    context "id doesn't exist and param are ok" do
      before do
        patch "/api/v1/brands/update/-1", params: {brand: {name: 'Pollo'}}
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end
    context "id doesn't exist and params aren't ok" do
      before do
        patch "/api/v1/brands/update/-1", params: {brand: {name: nil}}
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "DELETE /delete" do
    let(:brand) {create(:brand)}
    context "id exists" do
      before do
        delete "/api/v1/brands/delete/#{brand.id}"
      end
      it "return http status ok" do
        expect(response).to have_http_status(:ok)
      end
      it "delete instance correctly" do
        get "/api/v1/brands/show/#{brand.id}"
        expect(response).to have_http_status(:not_found)
      end
    end
    context "id doesn't exist" do
      before do
        delete "/api/v1/brands/delete/-1"
      end
      it "return http status not_found" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end