class RenameSoftwaresApplicationDomains < ActiveRecord::Migration
  def self.up
    rename_table :software_application_domains_softwares, :software_application_domains_tools
  end

  def self.down
    rename_table :software_application_domains_tools, :software_application_domains_softwares
  end
end
