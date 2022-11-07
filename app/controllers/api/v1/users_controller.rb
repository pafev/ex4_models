class Api::V1::UsersController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:logout]
    
    def login
        user = User.find_by!(email: params[:email])
        if user.valid_password?(params[:password])
            render json: user, status: :ok
        else
            head(:unauthorized)
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end
    def logout
        current_user.authentication_token = nil
        current_user.save!
        render json: {message: "Usuário #{current_user.name} (#{current_user.email}) deslogado com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end
end
