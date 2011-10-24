class AddMasterProjectToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :master_project_id, :integer
  end

  def self.down
    remove_column :projects, :master_project_id
  end
end
