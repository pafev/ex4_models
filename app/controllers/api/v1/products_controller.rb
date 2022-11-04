class Api::V1::ProductsController < ApplicationController
    def index
        products = Product.all
        render json: products, status: :ok
    end
    def show
        product = Product.find(params[:id])
        render json: product, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end
end
