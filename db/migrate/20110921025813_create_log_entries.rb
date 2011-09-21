class CreateLogEntries < ActiveRecord::Migration
  def change
    create_table :log_entries do |t|
      t.integer :member_id
      t.date :date
      t.string :exercise
      t.float :duration
      t.string :comment
      t.float :points

      t.timestamps
    end
  end
end
