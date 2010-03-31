class CreateSoftwareStatusesSoftwares < ActiveRecord::Migration
  def self.up
    create_table :software_statuses_softwares, :id => false do |t|
      t.column :software_id, :integer, :null => false
      t.column :software_status_id, :integer, :null => false
    end
    add_index :software_statuses_softwares, :software_id
    add_index :software_statuses_softwares, :software_status_id
  end

  def self.down
    drop_table :software_statuses_softwares
  end
end
