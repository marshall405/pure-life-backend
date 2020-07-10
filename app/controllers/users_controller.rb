class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create
    def create
        user = User.new(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password: params[:password], password_confirmation: params[:password_confirmation])
        if user.valid?
            if params[:provider]
                if params[:provider_access] === '654321'
                    user.saveWithType('provider')
                else
                    render json: {
                        errors: 'provider access key is incorrect'
                    }
                    return
                end
            else
                user.saveWithType('patient')
            end
            auth_token = AuthenticateUser.new(user.email, user.password).call
            render json: {
                user: user,   
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

    # def user_params
    #     params.permit(
    #         :email,
    #         :first_name,
    #         :last_name,
    #         :password,
    #         :password_confirmation
    #     )
    # end

end
