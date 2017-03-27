class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.integer :post_number
      t.string :state_province
      t.string :job_title
      t.string :phone_number
      t.string :contact_email
      t.text :description
      t.text :description_two
      t.timestamps
    end
  end
end
