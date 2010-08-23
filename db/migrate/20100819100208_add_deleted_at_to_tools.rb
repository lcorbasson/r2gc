class AddDeletedAtToTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :deleted_at, :datetime
  end

  def self.down
    remove_column :tools, :deleted_at
  end
end
