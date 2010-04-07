require File.dirname(__FILE__) + '/../spec_helper'

describe Calibration do
  before(:each) do
    @calibration = Calibration.new
  end

  it "should be valid" do
    @calibration.should be_valid
  end
end
