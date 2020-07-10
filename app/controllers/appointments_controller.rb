class AppointmentsController < ApplicationController

    skip_before_action :authorize_request, only: [:create, :destroy]
    
    def create
        print "\n\n\nIn the Appointments controller!\n\n\n"
        print "Params: #{params}\n\n\n"
        appointment = Appointment.create(patient_id: params[:patient_id], provider_id: params[:provider_id], date: params[:date])
        render json: appointment, except: [:created_at, :updated_at]
    end

    def destroy
        print "\n\n\nIn appointments#destroy\n\nParams: #{params}\n\n\n"
        appointment = Appointment.find_by(id: params[:id])
        appointment.destroy
        render json: appointment, except: [:created_at, :updated_at]
    end

end