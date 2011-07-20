class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.date :start_date
      t.date :end_date
      t.references :project
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
