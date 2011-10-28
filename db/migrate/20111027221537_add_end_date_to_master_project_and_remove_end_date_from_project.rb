class AddEndDateToMasterProjectAndRemoveEndDateFromProject < ActiveRecord::Migration
  def self.up
    add_column :master_projects, :end_date, :date
    remove_column :projects, :end_date
  end

  def self.down
    remove_column :master_projects, :end_date
    add_column :projects, :end_date, :date
  end
end
