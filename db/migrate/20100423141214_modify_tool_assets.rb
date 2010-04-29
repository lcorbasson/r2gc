class ModifyToolAssets < ActiveRecord::Migration
  def self.up
    begin
      add_column :tool_assets, :in_scrollable, :boolean
    rescue
       "oops"
     end
  end

  def self.down
    remove_column :tool_assets, :in_scrollable
  end
end
