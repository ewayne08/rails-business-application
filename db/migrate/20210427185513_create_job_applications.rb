class CreateJobApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :job_applications do |t|
      t.integer :user_id
      t.integer :job_listing_id
      t.text :availibility
      t.text :requirements

      t.timestamps
    end
  end
end
