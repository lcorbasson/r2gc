class ModifyBoolean < ActiveRecord::Migration
  def self.up
    change_column :tools, :mi_mobility, :boolean
    change_column :tools, :borrowing, :boolean
  end

  def self.down
    change_column :tools, :mi_mobility, :string
    change_column :tools, :borrowing, :string
  end
end
