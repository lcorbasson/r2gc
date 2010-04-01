class CreateToolAssets < ActiveRecord::Migration
  def self.up
    create_table :tool_assets do |t|
      t.string :asset_file_name
      t.string :asset_content_type
      t.integer :asset_file_size
      t.datetime :asset_updated_at
      t.text :legend
      t.string :type
      t.integer :tool_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tool_assets
  end
end
