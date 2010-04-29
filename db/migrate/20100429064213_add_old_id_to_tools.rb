class AddOldIdToTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :old_id, :integer
  end

  def self.down
    remove_column :tools, :old_id
  end
end
