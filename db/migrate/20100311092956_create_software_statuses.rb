class CreateSoftwareStatuses < ActiveRecord::Migration
  def self.up
    create_table :software_statuses do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :software_statuses
  end
end
