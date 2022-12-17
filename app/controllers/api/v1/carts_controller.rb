class Api::V1::CartsController < ApplicationController
    acts_as_token_authentication_handler_for User
    before_action :authentication_admin, except: [:view, :update_total_value]

    def create
        cart = Cart.new(cart_params)
        cart.save!
        render json: cart, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def delete
        cart = Cart.find(params[:id])
        cart.destroy!
        render json: {message: "Carrinho do usuário #{cart.user.email} destruído com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def update_total_value
        cart = Cart.find_by(user_id: current_user.id)
        cart.update!(cart_params_update)
        render json: cart, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def view
        cart = Cart.find_by(user_id: current_user.id)
        render json: cart, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    private
    def cart_params
        params.require(:cart).permit(:total_value, :user_id)
    end
    def cart_params_update
        params.require(:cart).permit(:total_value)
    end
end
