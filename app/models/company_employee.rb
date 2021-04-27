class CompanyEmployee < ApplicationRecord
    has_many :companies 
    has_many :employees, through: :companies


    def self.newest_companyemployee
        Companyemployee.order(created_at: :desc).limit(5)
    end
end