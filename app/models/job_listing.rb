class JobListing < ApplicationRecord
    belongs_to :company 
    has_many :job_applications
    has_many :users, through: :job_applications
end
