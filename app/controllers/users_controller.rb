class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create
    def create
        user = User.new(user_params)
        if user.valid?
            user.save
            auth_token = AuthenticateUser.new(user.email, user.password).call
            render json: {   
                response: 'user created',
                auth_token: auth_token
            }
        else
            render json: {
                message: 'user not created',
                errors: user.errors
            }
        end

    end

    private

    def user_params
        params.permit(
            :email,
            :first_name,
            :last_name,
            :password,
            :password_confirmation
        )
    end

end
