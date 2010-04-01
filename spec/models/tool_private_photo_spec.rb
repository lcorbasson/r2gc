require File.dirname(__FILE__) + '/../spec_helper'

describe ToolPrivatePhoto do
  before(:each) do
    @tool_private_photo = ToolPrivatePhoto.new
  end

  it "should be valid" do
    @tool_private_photo.should be_valid
  end
end
