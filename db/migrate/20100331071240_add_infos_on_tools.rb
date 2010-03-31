class AddInfosOnTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :localization_on_site_precision, :string
    add_column :tools, :internal_number, :string
  end

  def self.down
    remove_column :tools, :localization_on_site_precision
    remove_column :tools, :internal_number
  end
end
