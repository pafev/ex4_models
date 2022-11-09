class Api::V1::ProductsController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:create, :update, :delete]

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
        if current_user.is_admin
            product = Product.new(product_params)
            product.save!
            render json: product, status: :created
        else
            render json: {message: "Você não tem permissão para isso"}, status: :ok
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end
    def update
        if current_user.is_admin
            product = Product.find(params[:id])
            product.update!(product_params)
            render json: product, status: :ok
        else
            render json: {message: "Você não tem permissão para isso"}, status: :ok
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end
    def delete
        if current_user.is_admin
            product = Product.find(params[:id])
            product.destroy!
            render json: {message: "O produto #{product.name} foi destruído com sucesso"}, status: :ok
        else
            render json: {message: "Você não tem permissão para isso"}, status: :ok
        end
    rescue StandardError => e
        render json: e, status: :not_found
    end

    private
    def product_params
        params.require(:product).permit(:name, :description, :price, :stock_quantity, :brand_id, :category_id, images: [])
    end
end