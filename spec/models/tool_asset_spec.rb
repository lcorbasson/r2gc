require File.dirname(__FILE__) + '/../spec_helper'

describe ToolAsset do
  before(:each) do
    @tool_asset = ToolAsset.new
  end

  it "should be valid" do
    @tool_asset.should be_valid
  end
end
