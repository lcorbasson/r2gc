class CreateSearchSubentities < ActiveRecord::Migration
  def self.up
    create_table :search_subentities do |t|
      t.string :name
      t.integer :search_entity_id
      t.timestamps
    end
  end

  def self.down
    drop_table :search_subentities
  end
end
