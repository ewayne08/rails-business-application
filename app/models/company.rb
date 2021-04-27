class Company < ApplicationRecord

    belongs_to :company 
    belongs_to :user



    validates :name, :description, presence: true
    validates :level, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}


    def self.newest_companies
        Company.order(created_at: :desc).limit(5)
    end

    def company_attributes=(hash_of_attributes) #custom writer
        if !hash_of_attributes[:title].blank? && !hash_of_attributes[:genre].blank? && !hash_of_attributes[:difficulty].blank?
            self.company = Company.find_or_create_by(hash_of_attributes)
        end
    end

end