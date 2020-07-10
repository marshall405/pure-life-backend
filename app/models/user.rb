class User < ApplicationRecord
    has_many :posts
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true, length: {minimum: 6}
    has_secure_password

    enum role: [:patient, :provider]

    belongs_to :provider, optional: true
    belongs_to :patient, optional: true

    has_many :appointments, through: :patient
    has_many :appointments, through: :provider

    # save new user with either 'patient' or 'provider' to set appropriate foreign key!
    def saveWithType(type)
        if type === 'patient'
            self.role = 0
            p = Patient.create(first_name: self.first_name, last_name: self.last_name)
            self.patient_id = p.id
            self.save
            self
        elsif type === 'provider'
            self.role  = 1
            p = Provider.create(first_name: self.first_name, last_name: self.last_name)
            self.provider_id = p.id
            self.save
            self
        else
            raise "unacceptable argument [type] User.rb line 14"
        end

    end
end
