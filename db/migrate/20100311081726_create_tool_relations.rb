class CreateToolRelations < ActiveRecord::Migration
  def self.up
    create_table :tool_relations do |t|
      t.integer :tool_from_id
      t.integer :tool_to_id
      t.timestamps
    end
  end

  def self.down
    drop_table :tool_relations
  end
end
