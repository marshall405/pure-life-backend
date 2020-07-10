class AppointmentsController < ApplicationController
   
    def appointments
        render json: {
            appointments: current_user.appointments
        }
    end


end