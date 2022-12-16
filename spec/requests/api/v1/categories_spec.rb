require 'rails_helper'

RSpec.describe "Api::V1::Categories", type: :request do
  let(:user_admin) {create(:user, :admin)}
  let(:authentication_params_admin) {{
    'X-User-Email': user_admin.email, 
    'X-User-Token': user_admin.authentication_token
  }}
  
  let(:user) {create(:user)}
  let(:authentication_params) {{
    'X-User-Email': user.email, 
    'X-User-Token': user.authentication_token
  }}
  
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
      it { expect(response.body).to eq([
        {id: 1, name: 'Automóveis'}, 
        {id: 2, name: 'Utensílios de Cozinha'}
      ].to_json) }
    end
  end

  describe "GET /show" do
    let(:category) {create(:category, id: 1, name: 'Roupas')}

    context 'id exists, so' do
      before do
        get "/api/v1/categories/show/#{category.id}"
      end
      it 'return http status ok' do
        expect(response).to have_http_status(:ok)
      end
      it 'return the correct instance' do
        expect(response.body).to eq({id: 1, name: 'Roupas'}.to_json)
      end
    end

    context "id doesn't exists, so return http status not_found" do
      before do
        get "/api/v1/categories/show/-1"
      end
      it {expect(response).to have_http_status(:not_found)}
    end
  end

  describe "POST /create" do
    let(:category_params) {attributes_for(:category)}

    context "when params are ok and user is admin," do
      before do
        post "/api/v1/categories/create", params: {category: category_params}, headers: authentication_params_admin
      end
      it "return http status ok" do
        expect(response).to have_http_status(:created)
      end
    end

    context "when params aren't ok" do
      before do
        post "/api/v1/categories/create", params: {category: nil}, headers: authentication_params_admin
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "when user isn't admin" do
      before do
        post "/api/v1/categories/create", params: {category: category_params}, headers: authentication_params
      end
      it "return http status unauthorized" do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "PATCH /update" do
    let(:category) {create(:category)}

    context "when id exists, params are ok and user is admin" do
      before do
        patch "/api/v1/categories/update/#{category.id}", params: {category: {name: 'Maquiagens'}}, headers: authentication_params_admin
      end
      it "return http status ok" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "when id doesn't exists" do
      before do
        patch "/api/v1/categories/update/-1", params: {category: {name: 'Maquiagens'}}, headers: authentication_params_admin
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "when params aren't ok" do
      before do
        patch "/api/v1/categories/update/#{category.id}", params: {category: {name: nil}}, headers: authentication_params_admin
      end
      it "return http status bad_request" do
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "when user isn't admin" do
      before do
        patch "/api/v1/categories/update/#{category.id}", params: {category: {name: 'Maquiagens'}}, headers: authentication_params
      end
      it "return http status unauthorized" do
        expect(response).to have_http_status(:unauthorized)
      end
    end

  end

  describe "DELETE /delete" do
    let(:category) {create(:category)}

    context "when id exists and user is admin" do
      before do
        delete "/api/v1/categories/delete/#{category.id}", headers: authentication_params_admin
      end
      it "return http status ok" do
        expect(response).to have_http_status(:ok)
      end
      it "remove the correct instance" do
        expect(Category.all.include?(category)).to be_falsey
      end
    end

    context "when id doesn't exist" do
      before do
        delete "/api/v1/categories/delete/-1", headers: authentication_params_admin
      end
      it "return http status not_found" do
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when user isn't admin" do
      before do
        delete "/api/v1/categories/delete/#{category.id}", headers: authentication_params
      end
      it "return http status unauthorized" do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
