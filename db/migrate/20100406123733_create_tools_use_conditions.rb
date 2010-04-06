class CreateToolsUseConditions < ActiveRecord::Migration
  def self.up
     create_table :tools_use_conditions, :id => false do |t|
      t.column :tool_id, :integer, :null => false
      t.column :use_condition_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :tools_use_conditions
  end
end
