class Job < ApplicationRecord
    belongs_to :company 
    belongs_to :user


    validates :name, :category, :description, presence: true
    
    #scope :all_jobs, -> {group(:company_id).count)}
end
