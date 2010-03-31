class CreateCorrespondentsTools < ActiveRecord::Migration
  def self.up
    create_table :correspondents_tools, :id => false do |t|
      t.column :correspondent_id, :integer, :null => false
      t.column :tool_id, :integer, :null => false
    end
    add_index :correspondents_tools, :correspondent_id
    add_index :correspondents_tools, :tool_id
  end

  def self.down
    drop_table :correspondents_tools
  end
end
