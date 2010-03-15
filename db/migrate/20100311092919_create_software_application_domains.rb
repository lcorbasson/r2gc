class CreateSoftwareApplicationDomains < ActiveRecord::Migration
  def self.up
    create_table :software_application_domains do |t|
      t.string :application_domain
      t.timestamps
    end
  end

  def self.down
    drop_table :software_application_domains
  end
end
