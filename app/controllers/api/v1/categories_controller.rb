class Api::V1::CategoriesController < ApplicationController
    def index
        categories = Category.all
        render json: categories, status: :ok
    end
    def show
        category = Category.find(params[:id])
        render json: category, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end
end
