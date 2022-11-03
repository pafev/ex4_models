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
      it { expect(JSON.parse(response.body)).to eq([
        {
          'id' => 1,
          'name' => 'Automóveis',
          'created_at' => eval(Category.find(1).created_at.to_json),
          'updated_at' => eval(Category.find(1).updated_at.to_json)
        },
        {
          'id' => 2,
          'name' => 'Utensílios de Cozinha',
          'created_at' => eval(Category.find(2).created_at.to_json),
          'updated_at' => eval(Category.find(2).updated_at.to_json)
        }
      ])
      }
    end
  end
end
