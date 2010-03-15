require File.dirname(__FILE__) + '/../spec_helper'

describe SoftwareStatus do
  before(:each) do
    @software_status = SoftwareStatus.new
  end

  it "should be valid" do
    @software_status.should be_valid
  end
end
