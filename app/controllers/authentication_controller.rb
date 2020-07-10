class AuthenticationController < ApplicationController
    skip_before_action :authorize_request, only: :authenticate
    def authenticate 
        auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call 
        if auth_token
            user = User.find_by(email: auth_params[:email])
            render json: {
                user: user,
                appointments: user.appointments,
                auth_token: auth_token,
            }
        else
            user = User.find_by(email: auth_params[:email])
            render json: {
                errors: 'email or password is incorrect'
            }
        end

    end

    private

    def auth_params
        params.require(:authentication).permit(:email, :password, :password_confirmation)
    end

end
