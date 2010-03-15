class CreateTools < ActiveRecord::Migration
  def self.up
    create_table :tools, :force => true do |t|
      t.string :name
      t.integer :type
      t.integer :tool_subtype_id
      t.string :brand
      t.string :version
      t.integer :quantity
      t.integer :agency_id
      t.string :search_entity_name
      t.integer :agency_id
      t.boolean :software_can_develop_programs
      t.text :software_application_domain_comment
      t.text :mi_localization
      t.text :mi_localization_on_site
      t.text :operating_principles
      t.text :specifications
      t.text :software_description
      t.date :purchase_date
      t.integer :privacy
      t.boolean :mi_mobility
      t.boolean :use_on_site
      t.boolean :borrowing
      t.text :software_sharing_conditions
      t.text :explanatory_document
      t.text :calibration
      t.text :calibration_comment
      t.string :website
      t.text :comment
      t.timestamps

    end
    add_index :tools, ["id"], :name => "tools_id", :unique => true
  end

  def self.down
    drop_table :tools
  end
end
