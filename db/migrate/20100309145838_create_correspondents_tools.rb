class CreateCorrespondentsTools < ActiveRecord::Migration
  def self.up
    create_table :correspondents_tools, :id => false do |t|
      t.integer :tool_id
      t.integer :correspondent_id
      t.timestamps
    end
  end

  def self.down
    drop_table :correspondents_tools
  end
end
