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
end
