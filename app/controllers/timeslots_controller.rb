class TimeslotsController < ApplicationController
    skip_before_action :authorize_request, only: :update
    
    def update
        timeslot = Timeslot.find_by(id: params[:id])
        timeslot.update(available: params[:available])
        render json: timeslot, except: [:created_at, :updated_at]
    end

end