class AddLogoToLaboratory < ActiveRecord::Migration
  def self.up
    add_column :laboratories, :logo_file_name, :string
    add_column :laboratories, :logo_content_type, :string
    add_column :laboratories, :logo_file_size, :integer
    add_column :laboratories, :logo_updated_at, :datetime
  end

  def self.down
    remove_column :laboratories, :logo_file_name
    remove_column :laboratories, :logo_content_type
    remove_column :laboratories, :logo_file_size
    remove_column :laboratories, :logo_updated_at
  end
end
