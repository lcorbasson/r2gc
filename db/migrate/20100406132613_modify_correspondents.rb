class ModifyCorrespondents < ActiveRecord::Migration
  def self.up
    add_column :users, :title, :string
    add_column :users, :comments, :text
    add_column :users, :phone_number, :string

  end

  def self.down
  end
end
