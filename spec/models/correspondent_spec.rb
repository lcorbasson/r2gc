require File.dirname(__FILE__) + '/../spec_helper'

describe Correspondent do
  before(:each) do
    @correspondent = Correspondent.new
  end

  it "should be valid" do
    @correspondent.should be_valid
  end
end
