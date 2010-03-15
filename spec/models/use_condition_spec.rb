require File.dirname(__FILE__) + '/../spec_helper'

describe UseCondition do
  before(:each) do
    @use_condition = UseCondition.new
  end

  it "should be valid" do
    @use_condition.should be_valid
  end
end
