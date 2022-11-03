require 'rails_helper'

RSpec.describe "Api::V1::Categories", type: :request do
  describe "GET /index" do
    before do
      create(:category, name: 'Automóveis')
      create(:category, name: 'Utensílios de Cozinha')
      get '/api/v1/categories/index'
    end
    context 'return status http status ok' do
      it { expect(response).to have_http_status(:ok) }
    end
    context 'return a json' do
      it { expect(response.content_type).to eq('application/json; charset=utf-8') }
    end
  end
end
