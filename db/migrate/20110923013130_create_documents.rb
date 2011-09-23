class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.belongs_to :project
      t.text       :description
      t.string     :file
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
