class CorrespondentTool < ActiveRecord::Base

  belongs_to :tool
  belongs_to :correspondent

  belongs_to :main_correspondents, :conditions => { :main => true }

end
