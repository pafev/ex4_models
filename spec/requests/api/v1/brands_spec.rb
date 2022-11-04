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
end
