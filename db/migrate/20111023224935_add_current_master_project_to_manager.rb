class AddCurrentMasterProjectToManager < ActiveRecord::Migration
  def self.up
    add_column :users, 'current_master_project_id', :integer
  end

  def self.down
    remove_column :users, 'current_master_project_id'
  end
end
