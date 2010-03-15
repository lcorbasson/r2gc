class RenameCorrespondentsToConsumers < ActiveRecord::Migration
  def self.up
    rename_table :correspondents, :consumers
  end

  def self.down
    rename_table :consumers, :correspondents
  end
end
