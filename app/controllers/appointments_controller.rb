class AppointmentsController < ApplicationController

    skip_before_action :authorize_request, only: [:index, :create, :destroy]

    def index
        render json: Appointment.all, except: [:created_at, :updated_at]
    end
    
    def create
        appointment = Appointment.create(patient_id: params[:patient_id], provider_id: params[:provider_id], date: params[:date])
        render json: appointment, except: [:created_at, :updated_at]
    end

    def destroy
        appointment = Appointment.find_by(id: params[:id])
        appointment.destroy
        render json: appointment, except: [:created_at, :updated_at]
    end

end