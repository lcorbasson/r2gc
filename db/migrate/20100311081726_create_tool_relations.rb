class CreateToolRelations < ActiveRecord::Migration
  def self.up
    create_table :tool_relations, {:id => false} do |t|
      t.integer :tool_id
      t.integer :tool_target_id
      t.timestamps
    end
  end

  def self.down
    drop_table :tool_relations
  end
end
