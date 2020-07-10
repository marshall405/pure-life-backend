class ProvidersController < ApplicationController
    skip_before_action :authorize_request, only: [:schedule, :appointments]
    
    def schedule
        render json: Provider.find_by(id: params[:id]).timeslots, except: [:created_at, :updated_at]
    end

    def appointments
        render json: Provider.find_by(id: params[:id]).appointments, except: [:created_at, :updated_at]
    end

end