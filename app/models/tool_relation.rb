class ToolRelation <  ActiveRecord::Base

  belongs_to :tool_from, :class_name => 'Tool', :foreign_key => 'tool_from_id'
  belongs_to :tool_to, :class_name => 'Tool', :foreign_key => 'tool_to_id'
 
end
