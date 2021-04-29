class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      create_table :jobs do |t|
        t.integer :company_id
        t.text :requirements
        t.text :schedule 

      t.timestamps
    end
  end
end
