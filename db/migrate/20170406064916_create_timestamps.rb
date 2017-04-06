class CreateTimestamps < ActiveRecord::Migration[5.0]
  def change
    create_table :timestamps do |t|
      t.integer :user_id
      t.integer :work_time
      t.integer :ot1_time
      t.integer :ot2_time
      t.column :time_in, :datetime
      t.column :time_out, :datetime
    end
  end
end
