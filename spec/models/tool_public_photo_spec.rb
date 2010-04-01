require File.dirname(__FILE__) + '/../spec_helper'

describe ToolPublicPhoto do
  before(:each) do
    @tool_public_photo = ToolPublicPhoto.new
  end

  it "should be valid" do
    @tool_public_photo.should be_valid
  end
end
