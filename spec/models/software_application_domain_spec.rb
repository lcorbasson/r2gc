require File.dirname(__FILE__) + '/../spec_helper'

describe SoftwareApplicationDomain do
  before(:each) do
    @software_application_domain = SoftwareApplicationDomain.new
  end

  it "should be valid" do
    @software_application_domain.should be_valid
  end
end
