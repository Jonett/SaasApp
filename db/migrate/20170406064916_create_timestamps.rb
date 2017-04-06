class CreateTimestamps < ActiveRecord::Migration[5.0]
  def change
    create_table :timestamps do |t|
      t.integer :user_id 
      t.integer :work_time #duration
      t.integer :ot1_time
      t.integer :ot2_time
      t.column :time_in, :datetime #punch_in
      t.column :time_out, :datetime #punch_out
    end
  end
end
