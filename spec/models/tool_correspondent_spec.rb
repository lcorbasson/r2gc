require File.dirname(__FILE__) + '/../spec_helper'

describe ToolCorrespondent do
  before(:each) do
    @tool_correspondent = ToolCorrespondent.new
  end

  it "should be valid" do
    @tool_correspondent.should be_valid
  end
end
