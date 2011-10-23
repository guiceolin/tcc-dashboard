class CreateMasterProjects < ActiveRecord::Migration
  def self.up
    create_table :master_projects do |t|
      t.references :owner
      t.text :description
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :master_projects
  end
end
