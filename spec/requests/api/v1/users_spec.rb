require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  let(:user) {create(:user, password: 'batata')}
  let(:authentication_params) {{
    'X-User-Email': user.email, 
    'X-User-Token': user.authentication_token
    }
  }

  let(:user_admin) {create(:user, :admin, email: 'admin@paulo')}
  let(:authentication_params_admin) {{
    'X-User-Email': user_admin.email, 
    'X-User-Token': user_admin.authentication_token
    }
  }

  describe "GET /index" do
    let (:user_admin) {create(:user, :admin, email: 'admin@paulo')}

    context "user was logged in and is admin, so" do
      before do
        get "/api/v1/users/index", headers: authentication_params_admin
      end
      it "return http status ok" do
        expect(response).to have_http_status(:ok)
      end
      it "return a json" do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "user was logged in, but isn't admin, so" do
      before do
        get "/api/v1/users/index", headers: authentication_params
      end
      it "return http status unauthorized" do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
  
  describe "GET /login" do
    context "when params are ok and valids" do
      it "return http status ok" do
        get "/api/v1/users/login", params: {email: user.email, password: 'batata'}
        expect(response).to have_http_status(:ok)
      end
    end
    context "when params are ok, but invalids" do
      it "return http status unauthorized" do
        get "/api/v1/users/login", params: {email: user.email, password: 'batata2'}
        expect(response).to have_http_status(:unauthorized)
      end
    end
    context "when params aren't ok" do
      it "return http status unauthorized" do
        get "/api/v1/users/login", params: nil
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "GET /logout" do
    context "user was logged in, so" do
      it "return http status ok" do
        get "/api/v1/users/logout", headers: {'X-User-Email': user.email, 'X-User-Token': user.authentication_token}
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "POST /create" do
    context "params are ok" do
      let(:user_params) {attributes_for(:user)}
      it "return http status created" do
        post "/api/v1/users/create", params: {user: user_params}
        expect(response).to have_http_status(:created)
      end
    end

    context "params aren't ok" do
      it "return http status bad_request" do
        post "/api/v1/users/create", params: {user: nil}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
