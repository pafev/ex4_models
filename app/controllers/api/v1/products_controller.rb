class Api::V1::ProductsController < ApplicationController
    acts_as_token_authentication_handler_for User, except: [:index, :show, :index_per_category]
    before_action :authentication_admin, except: [:index, :show, :update_stock_quantity, :index_per_category]

    def index
        products = Product.all
        render json: products, status: :ok
    end

    def index_per_category
        category = Category.find(params[:id])
        products = category.products
        render json: products, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
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

    def update_stock_quantity
        product = Product.find(params[:id])
        product.update!(product_params_stock_quantity)
        render json: product, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def delete
        product = Product.find(params[:id])
        product.destroy!
        render json: {message: "O produto #{product.name} foi destruído com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    private
    def product_params
        params.require(:product).permit(:name, :description, :price, :stock_quantity, :brand_id, :category_id, images: [])
    end
    def product_params_stock_quantity
        params.require(:product).permit(:stock_quantity)
    end
end