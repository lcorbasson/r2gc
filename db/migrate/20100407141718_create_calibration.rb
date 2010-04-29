class CreateCalibration < ActiveRecord::Migration
  def self.up
     begin
        create_table :calibrations do |t|
          t.string :calibration
        end
     rescue
       "oops"
     end


   
  end

  def self.down
    drop_table :calibrations
    rename_column :tools, :calibration_id, :calibrations
    change_column :tools, :calibrations, :text
  end
end
