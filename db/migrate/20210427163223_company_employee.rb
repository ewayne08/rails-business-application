class CompanyEmployee < ActiveRecord::Migration[6.1]
  def change
    t.belongs_to :company 
    t.belongs_to :user 
  end
end
