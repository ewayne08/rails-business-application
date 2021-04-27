class AddDescriptionToCompany < ActiveRecord::Migration[6.1]
  def change
    add_column :company, :description, :text
  end
end
