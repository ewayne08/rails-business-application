class User < ApplicationRecord
    has_secure_password

    has_many :job_applications
    has_many :companies, through: :job_applications

    validates :username, :email, presence: true, uniqueness: true
end