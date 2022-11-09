class Api::V1::BrandsController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:create, :update, :delete]
    
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
    def create
        if current_user.is_admin
            brand = Brand.new(brand_params)
            brand.save!
            render json: brand, status: :created
        else
            render json: {message: "Você não tem permissão para isso"}, status: :ok
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end
    def update
        if current_user.is_admin
            brand = Brand.find(params[:id])
            brand.update!(brand_params)
            render json: brand, status: :ok
        else
            render json: {message: "Você não tem permissão para isso"}, status: :ok
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end
    def delete
        if current_user.is_admin
            brand = Brand.find(params[:id])
            brand.destroy!
            render json: {message: "Marca #{brand.name} destruída com sucesso!"}, status: :ok
        else
            render json: {message: "Você não tem permissão para isso"}, status: :ok
        end
    rescue StandardError => e
        render json: e, status: :not_found
    end

    private
    def brand_params
        params.require(:brand).permit(:name, :logo)
    end
end
