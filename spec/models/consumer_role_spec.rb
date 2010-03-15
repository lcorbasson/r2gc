require File.dirname(__FILE__) + '/../spec_helper'

describe ConsumerRole do
  before(:each) do
    @consumer_role = ConsumerRole.new
  end

  it "should be valid" do
    @consumer_role.should be_valid
  end
end
