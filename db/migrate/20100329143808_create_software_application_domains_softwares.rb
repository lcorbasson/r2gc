class CreateSoftwareApplicationDomainsSoftwares < ActiveRecord::Migration
  def self.up
     create_table :software_application_domains_softwares, :id => false do |t|
      t.column :software_id, :integer, :null => false
      t.column :software_application_domain_id, :integer, :null => false
    end    
  end

  def self.down
    rop_table :software_application_domains_softwares
  end
end
