class Api::V1::UsersController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:logout, :index]
    
    def index
        if current_user.is_admin
            users = User.all
            render json: users, status: :ok
        else
            render json:{message: "Você não tem permissão para isso"}, status: :unauthorized
        end
    end
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
