class Api::V1::AddressesController < ApplicationController
    acts_as_token_authentication_handler_for User

    def index
        addresses = Address.all.select { |address| address.user_id == current_user.id }
        render json: addresses, status: :ok
    end

    def create
        address = Address.new(description: address_params[:description], user_id: current_user.id)
        address.save!
        render json: address, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def update
        address = Address.find(params[:id])
        user_addresses = Address.all.select { |user_address| user_address.user_id == current_user.id }
        if user_addresses.include?(address)
            address.update!(address_params)
            render json: address, status: :ok
        else
            head(:bad_request)
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def delete
        address = Address.find(params[:id])
        user_addresses = Address.all.select { |user_address| user_address.user_id == current_user.id }
        if user_addresses.include?(address)
            address.destroy!
            render json: address, status: :ok
        else
            head(:bad_request)
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private
    def address_params
        params.require(:address).permit(:description)
    end
end
