class Api::V1::BrandsController < ApplicationController
    def index
        brands = Brand.all
        render json: brands, status: :ok
    end
    def show
        brand = Brand.find(params[:id])
        render json: brand, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end
end
