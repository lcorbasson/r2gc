class ToolRelation < ActiveRecord::Base

  belongs_to :tool
  belongs_to :tool_target, :class_name => 'Tool', :foreign_key => 'tool_target_id'

end
