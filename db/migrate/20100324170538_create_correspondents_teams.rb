class CreateCorrespondentsTeams < ActiveRecord::Migration
  def self.up
    create_table :correspondents_teams, :id => false do |t|
      t.column :correspondent_id, :integer, :null => false
      t.column :team_id, :integer, :null => false
    end
    add_index :correspondents_teams, :correspondent_id
    add_index :correspondents_teams, :team_id
  end

  def self.down
    drop_table :correspondents_teams
  end
end
