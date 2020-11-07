

class Patient
    
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date, patient)
        Appointment.new(date, self, patient)
    end

    def appointments
        Appointment.all.select { |app| app.patient == self}
    end

    def doctors
        appointments.collect do |app|
          app.doctor
        end
    end 
end