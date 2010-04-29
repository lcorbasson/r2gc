class MigrateSoftwares < ActiveRecord::Migration
  def self.up
    Rake::Task['r2gc:bootstrap'].invoke
  end

  def self.down
  end
end
