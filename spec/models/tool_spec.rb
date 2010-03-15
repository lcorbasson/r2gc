require File.dirname(__FILE__) + '/../spec_helper'

describe Tool do
  before(:each) do
    @tool = Tool.new
  end

  it "should be valid" do
    @tool.should be_valid
  end
end
