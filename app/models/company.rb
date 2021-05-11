class Company < ApplicationRecord
    belongs_to :owner, class_name: "User", foreign_key: :user_id
    has_many :jobs 
    has_many :users, through: :jobs



    validates :name, :description, presence: true
    
    scope :newest_companies, -> {order(created_at: :desc).limit(5)}
    #def self.newest_companies
     #   Company.order(created_at: :desc).limit(5)
    #end
    #MACROS(methods we have access to)
    #association
    #association=
    #build_association
    #create_association
    
end