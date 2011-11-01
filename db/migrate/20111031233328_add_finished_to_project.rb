class AddFinishedToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :finished, :boolean
  end

  def self.down
    remove_column :projects, :finished
  end
end
