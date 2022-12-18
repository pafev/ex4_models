class Api::V1::PurchasesController < ApplicationController
    acts_as_token_authentication_handler_for User

    def index
        # cart = current_user.cart
        cart = Cart.find_by(user_id: current_user.id)
        # purchases = cart.purchases
        purchases = Purchase.all.select { |purchase| purchase.cart_id == cart.id }
        render json: purchases, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def show
        purchase = Purchase.find(params[:id])
        render json: purchase, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create
        cart = Cart.find_by(user_id: current_user.id)
        purchase = Purchase.new(product_id: purchase_params_create, cart_id: cart.id)
        purchase.save!
        render json: purchase, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def delete
        purchase = Purchase.find(params[:id])
        user_cart = Cart.find_by(user_id: current_user.id)
        user_purchases = Purchase.all.select { |user_purchase| user_purchase.cart_id == user_cart.id }
        if user_purchases.include?(purchase)
            purchase.destroy!
            render json: {message: "O a compra de id #{purchase.id} foi destruída com sucesso"}, status: :ok
        else
            head(:bad_request)
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private
    def purchase_params_create
        object = params.require(:purchase).permit(:product_id)
        object[:product_id]
    end
end
