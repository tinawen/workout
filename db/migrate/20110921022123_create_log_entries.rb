class CreateLogEntries < ActiveRecord::Migration
  def change
    create_table :log_entries do |t|
      t.string :name
      t.date :date
      t.string :exercise
      t.float :duration
      t.string :comment
      t.float :points

      t.timestamps
    end
  end
end
