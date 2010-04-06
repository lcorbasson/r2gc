class UseCondition < ActiveRecord::Base

  has_and_belongs_to_many :tools

  named_scope :for_tools, :conditions => {:tool_type => "tool"}
  named_scope :for_test_and_measuring, :conditions => {:tool_type => "other"}

  validates_presence_of :conditions, :tool_type

  before_destroy do |use_condition|
    use_condition.tools = []
  end

end
