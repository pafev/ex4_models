class Api::V1::UsersController < ApplicationController
    def login
        user = User.find_by!(email: params[:email])
        if user.valid_password?(params[:password])
            render json: user, status: :ok
        else
            head(:unauthorized)
        end
    rescue StandardError => e
        render json: e, status: :unauthorized
    end
end
