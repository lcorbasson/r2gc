class CreateCorrespondents < ActiveRecord::Migration
  def self.up
    create_table :correspondents do |t|
      t.string :last_name
      t.string :first_name
      t.string :phone
      t.string :email
      t.text :note
      

      t.timestamps
    end
  end

  def self.down
    drop_table :correspondents
  end
end
