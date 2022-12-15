class ApplicationController < ActionController::API
    private

    def authentication_admin
        unless current_user.is_admin == true
            render json: {message: "Você não tem permissão para isso"}, status: :unauthorized
        end       
    end 
end
