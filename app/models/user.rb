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
end
