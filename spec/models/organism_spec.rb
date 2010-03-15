require File.dirname(__FILE__) + '/../spec_helper'

describe Organism do
  before(:each) do
    @organism = Organism.new
  end

  it "should be valid" do
    @organism.should be_valid
  end
end
