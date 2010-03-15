class AddRoleToConsumer < ActiveRecord::Migration
  def self.up
    add_column :consumers, :consumer_role_id, :integer
  end

  def self.down
    remove_column :consumers, :consumer_role_id
  end
end
