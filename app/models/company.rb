class Company < ApplicationRecord

    has_many :job_applications 
    has_many :users, through: :job_applications



    validates :name, :description, presence: true
    validates :level, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}


    def self.newest_companies
        Company.order(created_at: :desc).limit(5)
    end

end