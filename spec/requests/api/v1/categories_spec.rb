require 'rails_helper'

RSpec.describe "Api::V1::Categories", type: :request do
  describe "GET /index" do
    before do
      create(:category, id: 1, name: 'Automóveis')
      create(:category, id: 2, name: 'Utensílios de Cozinha')
      get '/api/v1/categories/index'
    end
    context 'return status http status ok' do
      it { expect(response).to have_http_status(:ok) }
    end
    context 'return a json' do
      it { expect(response.content_type).to eq('application/json; charset=utf-8') }
    end
    context 'return the created instances' do
      it { expect(response.body).to eq(Category.all.to_json) }
    end
  end

  describe "GET /show" do
    let(:category) {create(:category)}
    context 'id exist, so' do
      before do
        get "/api/v1/categories/show/#{category.id}"
      end
      it 'return http status ok' do
        expect(response).to have_http_status(:ok)
      end
      it 'return the correct instance' do
        expect(response.body).to eq(category.to_json)
      end
    end
    context "id doesn't exist, so return http status bad_request" do
      before do
        get "/api/v1/categories/show/-1"
      end
      it {expect(response).to have_http_status(:bad_request)}
    end
  end

  describe "POST /create" do
    context "when params are ok," do
      let(:category_params) {attributes_for(:category)}
      before do
        post "/api/v1/categories/create", params: {category: category_params}
      end
      it "return http status ok" do
        expect(response).to have_http_status(:created)
      end
      it "category should be uniq" do
        post "/api/v1/categories/create", params: {category: category_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
    context "when params aren't ok" do
      category_params = nil
      before do
        post "/api/v1/categories/create", params: {category: category_params}
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
