class Company < ApplicationRecord

    has_many :jobs 
    has_many :users, through: :jobs



    validates :name, :description, presence: true
    validates :level, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}


    def self.newest_companies
        Company.order(created_at: :desc).limit(5)
    end

end