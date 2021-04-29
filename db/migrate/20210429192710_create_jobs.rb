class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      
        t.string :name
        t.string :category
        t.integer :user_id
        t.integer :company_id
        

      t.timestamps
    end
  end
end
