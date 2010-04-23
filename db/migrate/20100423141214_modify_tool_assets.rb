class ModifyToolAssets < ActiveRecord::Migration
  def self.up
    add_column :tool_assets, :in_scrollable, :boolean
  end

  def self.down
    remove_column :tool_assets, :in_scrollable
  end
end
