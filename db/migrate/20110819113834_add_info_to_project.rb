class AddInfoToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :description, :text
    add_column :projects, :end_date, :date
  end

  def self.down
    remove_column :projects, :description
    remove_column :projects, :end_date
  end
end
