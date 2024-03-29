class CreateKeys < ActiveRecord::Migration
  def self.up
    create_table :keys do |t|
      t.string :name
      t.references :user
      t.text :key

      t.timestamps
    end
  end

  def self.down
    drop_table :keys
  end
end
