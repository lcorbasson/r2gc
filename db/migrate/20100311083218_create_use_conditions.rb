class CreateUseConditions < ActiveRecord::Migration
  def self.up
    create_table :use_conditions do |t|
      t.string :tool_type
      t.text :conditions
      t.timestamps
    end
  end

  def self.down
    drop_table :use_conditions
  end
end
