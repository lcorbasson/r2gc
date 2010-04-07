class RenameSoftwaresApplicationDomainsToolId < ActiveRecord::Migration
  def self.up
    rename_column :software_application_domains_tools, :software_id, :tool_id
  end

  def self.down
    rename_column :software_application_domains_tools, :tool_id, :software_id
  end
end
