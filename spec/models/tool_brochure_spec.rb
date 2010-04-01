require File.dirname(__FILE__) + '/../spec_helper'

describe ToolBrochure do
  before(:each) do
    @tool_brochure = ToolBrochure.new
  end

  it "should be valid" do
    @tool_brochure.should be_valid
  end
end
