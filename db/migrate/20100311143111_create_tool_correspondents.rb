class CreateToolCorrespondents < ActiveRecord::Migration
  def self.up
    create_table :tool_correspondents do |t|
      t.integer :tool_id
      t.integer :correspondent_id
      t.timestamps
    end
  end

  def self.down
    drop_table :tool_correspondents
  end
end
