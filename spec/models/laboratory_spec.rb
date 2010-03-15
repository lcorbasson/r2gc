require File.dirname(__FILE__) + '/../spec_helper'

describe Laboratory do
  before(:each) do
    @laboratory = Laboratory.new
  end

  it "should be valid" do
    @laboratory.should be_valid
  end
end
