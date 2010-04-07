class ModifyUseOnSiteToBoolean < ActiveRecord::Migration
  def self.up
    change_column :tools, :use_on_site, :boolean
  end

  def self.down
    change_column :tools, :use_on_site, :string
  end
end
