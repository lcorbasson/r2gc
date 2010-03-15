require File.dirname(__FILE__) + '/../spec_helper'

describe ToolSubtype do
  before(:each) do
    @tool_subtype = ToolSubtype.new
  end

  it "should be valid" do
    @tool_subtype.should be_valid
  end
end
