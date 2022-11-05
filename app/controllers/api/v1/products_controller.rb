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
    def create
        product = Product.new(product_params)
        product.save!
        render json: product, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end
    def update
        product = Product.find(params[:id])
        product.update!(product_params)
        render json: product, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private
    def product_params
        params.require(:product).permit(:name, :description, :price, :stock_quantity, :brand_id, :category_id)
    end
end
