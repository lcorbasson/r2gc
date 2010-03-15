require File.dirname(__FILE__) + '/../spec_helper'

describe Equipment do
  before(:each) do
    @equipment = Equipment.new
  end

  it "should be valid" do
    @equipment.should be_valid
  end
end
