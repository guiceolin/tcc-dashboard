class AddArchivedToMessages < ActiveRecord::Migration
  def self.up
    add_column :deliveries, :archived, :boolean, :default => false
  end

  def self.down
    remove_column :deliveries, :archived
  end
end
