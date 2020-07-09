class ProvidersController < ApplicationController
    skip_before_action :authorize_request, only: :schedule
    
    def schedule
        render json: Provider.find_by(id: params[:id]).timeslots
    end

end