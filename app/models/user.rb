class User < ApplicationRecord
    

    has_many :jobs, through: :companies 

    validates :username, :email, presence: true, uniqueness: true
end