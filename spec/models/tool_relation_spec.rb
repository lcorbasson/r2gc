require File.dirname(__FILE__) + '/../spec_helper'

describe ToolRelation do
  before(:each) do
    @tool_relation = ToolRelation.new
  end

  it "should be valid" do
    @tool_relation.should be_valid
  end
end
