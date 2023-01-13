class Api::V1::ProductsController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:create, :update, :update_stock_quantity, :delete, :clear_images, :add_image]
    before_action :authentication_admin, only: [:create, :update, :delete, :clear_images, :add_image]

    def index
        products = Product.all
        render json: products, status: :ok
    end

    def index_paginated
        page = params[:page].to_i
        per_page = params[:per_page].to_i
        offset = (page - 1) * per_page
        products = Product.all.limit(per_page).offset(offset)
        render json: products, status: :ok
    end

    def index_per_category
        products = Product.all.select { |product| product.category_id == params[:id].to_i }
        render json: products, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def index_category_paginated
        page = params[:page].to_i
        per_page = params[:per_page].to_i
        offset = (page - 1) * per_page
        products = Product.all.select { |product| product.category_id == params[:id].to_i }
        products_paginated = products[offset, (offset + per_page)]
        render json: products_paginated, status: :ok
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
        render json: product, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def clear_images
        product = Product.find(params[:id])
        if product.images.attached?
            product.images.purge
        end
        render json: product, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def add_image
        product = Product.find(params[:id])
        params[:images].each do |image|
            product.images.attach(image)
        end
        render json: product, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private
    def product_params
        params.require(:product).permit(:name, :description, :price, :stock_quantity, :brand_id, :category_id, images: [])
    end
    def product_params_stock_quantity
        params.require(:product).permit(:stock_quantity)
    end

    
end