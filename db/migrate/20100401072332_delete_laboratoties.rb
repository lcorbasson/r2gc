class DeleteLaboratoties < ActiveRecord::Migration
  def self.up
    drop_table :laboratories
    rename_table :agencies, :laboratories
    rename_column :tools, :agency_id, :laboratory_id
  end

  def self.down
  end
end
