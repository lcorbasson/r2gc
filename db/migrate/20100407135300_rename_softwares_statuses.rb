class RenameSoftwaresStatuses < ActiveRecord::Migration
  def self.up
    rename_table :software_statuses_softwares, :software_statuses_tools
    rename_column :software_statuses_tools, :software_id, :tool_id
  end

  def self.down
    rename_table :software_statuses_tools, :software_statuses_softwares
    rename_column :software_statuses_softwares, :tool_id, :software_id
  end
end
