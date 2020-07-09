class Provider < ApplicationRecord
    has_many :appointments
    has_many :timeslots
    after_create :create_timeslots

    def create_timeslots
        for day in 0..6 do
            for hour in 6..22 do
                self.timeslots.create(day: day, hour: hour)
            end
        end
        print "\n\n\n    Testing.... \n\n#{self.timeslots}\n\n\n\n"
    end
    
end
