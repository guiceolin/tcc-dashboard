class AddDefaultTypeToUser < ActiveRecord::Migration
  def self.up
     change_column_default(:users, :type, 'Member')
  end

  def self.down
     change_column_default(:users, :type, nil)
  end
end
