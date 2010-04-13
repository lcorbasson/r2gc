class ToolSubtype < ActiveRecord::Base


  named_scope :for_test_engines, :conditions => ["tool_type = ?", "TestEngine"]
  named_scope :for_tool_engines, :conditions => ["tool_type = ?", "ToolEngine"]
  named_scope :for_softwares, :conditions => ["tool_type = ?", "Software"]
  named_scope :for_measuring_engines, :conditions => ["tool_type = ?", "MeasuringEngine"]

end
