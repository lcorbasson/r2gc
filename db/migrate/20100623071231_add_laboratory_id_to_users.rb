class AddLaboratoryIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :laboratory_id, :integer
  end

  def self.down
    remove_column :users, :laboratory_id
  end
end
