class PatientsController < ApplicationController
    skip_before_action :authorize_request, only: [:show, :appointments]
    
    def show
        render json: Patient.find_by(id: params[:id]), only: [:first_name, :last_name]
    end

    def appointments
        render json: Patient.find_by(id: params[:id]).appointments, except: [:created_at, :updated_at]
    end

end