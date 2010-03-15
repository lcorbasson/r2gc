class CreateConsumerRoles < ActiveRecord::Migration
  def self.up
    create_table :consumer_roles do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :consumer_roles
  end
end
