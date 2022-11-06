class Api::V1::CartsController < ApplicationController
    acts_as_token_authentication_handler_for User
    
    def create
        if current_user.is_admin
            cart = Cart.new(cart_params)
            cart.save!
            render json: cart, status: :created
        else
            render json: {message: "Você não tem permissão para isso"}, status: :ok
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end
    def delete
        if current_user.is_admin
            cart = Cart.find(params[:id])
            cart.destroy!
            render json: {message: "Carrinho do usuário #{cart.user.email} destruído com sucesso"}, status: :ok
        else
            render json: {message: "Você não tem permissão para isso"}, status: :ok
        end
    rescue StandardError => e
        render json: e, status: :not_found
    end
    def view
        cart = current_user.cart
        render json: cart, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    private
    def cart_params
        params.require(:cart).permit(:total_value, :user_id)
    end
end
