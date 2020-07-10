class ProvidersController < ApplicationController
    skip_before_action :authorize_request, only: :schedule
    
    
    # when were ready to enable authorize_request
    # we will have current_user available to use, 

    # we can check current_user
    # current_user.id === params[:id]


    def schedule
        render json: Provider.find_by(id: params[:id]).timeslots
    end

end