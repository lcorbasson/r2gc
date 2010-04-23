class CreateCalibration < ActiveRecord::Migration
  def self.up
    create_table :calibrations do |t|
      t.string :calibration
    end
   
  end

  def self.down
    drop_table :calibrations
    rename_column :tools, :calibration_id, :calibrations
    change_column :tools, :calibrations, :text
  end
end
