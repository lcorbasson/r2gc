class DeleteMainCorrespondentIdFromTools < ActiveRecord::Migration
  def self.up
#    add_column :correspondent_tools, :main, :boolean
    CorrespondentTool.update_all("main = false")
    Tool.all.each do |tool|
      if tool.main_correspondent_id
        if tool.correspondents.include?(Correspondent.find(tool.main_correspondent_id))
            relation = CorrespondentTool.find(:first, :conditions => ["tool_id = ? and correspondent_id = ?", tool.id, tool.main_correspondent_id])
            relation.update_attribute(:main, true)
        else
          CorrespondentTool.create!(
          :correspondent_id => tool.main_correspondent_id,
          :tool_id => tool.id,
          :main => true
        )
        end
      end
    end
    remove_column :correspondent_tools, :main_correspondent_id
  end

  def self.down
  end
end
