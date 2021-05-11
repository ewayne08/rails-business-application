class User < ApplicationRecord
    has_secure_password
    #has_many :companies
    has_many :jobs

    #has_many :posted_jobs, through: :companies, source: :jobs
    has_many :companies, through: :jobs

    validates :username, :email, presence: true, uniqueness: true
end