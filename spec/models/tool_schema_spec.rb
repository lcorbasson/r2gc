require File.dirname(__FILE__) + '/../spec_helper'

describe ToolSchema do
  before(:each) do
    @tool_schema = ToolSchema.new
  end

  it "should be valid" do
    @tool_schema.should be_valid
  end
end
