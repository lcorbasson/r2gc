class AddHeadquartersToLaboratories < ActiveRecord::Migration
  def self.up
    add_column :laboratories, :headquarters, :string
  end

  def self.down
    remove_column :laboratories, :headquarters
  end
end
