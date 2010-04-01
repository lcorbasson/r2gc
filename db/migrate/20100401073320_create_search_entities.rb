class CreateSearchEntities < ActiveRecord::Migration
  def self.up
    create_table :search_entities do |t|
      t.string :name
      t.integer :laboratory_id
    end
    add_column :users, :search_entity_id, :integer
    add_column :users, :search_subentity_id, :integer
  end

  def self.down
    drop_table :search_entities
    remove_column :users, :search_entity_id
    remove_column :users, :search_subentity_id
  end
end
