class CreateAgencies < ActiveRecord::Migration
  def self.up
    create_table :agencies do |t|
      t.string :name
      t.string :legal_status
      t.string :activity_sector
      t.text :activity
      t.text :partners
      t.string :memberships
      t.string :website
      t.string :appellation
      t.string :street
      t.string :zipcode
      t.string :city
      t.string :PO_box
      t.string :cedex
      t.string :country
      t.string :phone
      t.string :parent
      t.timestamps
    end
  end

  def self.down
    drop_table :agencies
  end
end
