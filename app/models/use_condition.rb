class UseCondition < ActiveRecord::Base

  named_scope :for_tools, :conditions => {:tool_type => "tool"}
  named_scope :for_test_and_measuring, :conditions => {:tool_type => "other"}

  validates_presence_of :conditions, :tool_type

end
