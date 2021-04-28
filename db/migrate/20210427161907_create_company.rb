class CreateCompany < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :category
      t.integer :user_id

      t.timestamps
    end
  end
end
