class ImportUsers < ActiveRecord::Migration
  def self.up
    Rake::Task['r2gc:last_import'].invoke
  end

  def self.down
  end
end
