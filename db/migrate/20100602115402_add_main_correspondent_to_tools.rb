class AddMainCorrespondentToTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :main_correspondent_id, :integer
  end

  def self.down
    remove_column :tools, :main_correspondent_id
  end
end
