class CreateDeliveries < ActiveRecord::Migration
  def self.up
    create_table :deliveries do |t|
      t.belongs_to :message
      t.belongs_to :user
      t.boolean :read

      t.timestamps
    end
  end

  def self.down
    drop_table :deliveries
  end
end
