class CreateToolSubtypes < ActiveRecord::Migration
  def self.up
    create_table :tool_subtypes do |t|
      t.string :name
      t.string :tool_type
      t.timestamps
    end
  end

  def self.down
    drop_table :tool_subtypes
  end
end
