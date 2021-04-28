class CreateJobListings < ActiveRecord::Migration[6.1]
  def change
    create_table :job_listings do |t|
      t.integer :company_id
      t.text :requirements
      t.text :schedule 

      t.timestamps
    end
  end
end
