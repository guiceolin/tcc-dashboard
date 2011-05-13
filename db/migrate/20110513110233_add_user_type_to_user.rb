class AddUserTypeToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :type, :string, :null => false
  end

  def self.down
    remove_column :users, :type
  end
end
