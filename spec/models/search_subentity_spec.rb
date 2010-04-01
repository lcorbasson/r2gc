require File.dirname(__FILE__) + '/../spec_helper'

describe SearchSubentity do
  before(:each) do
    @search_subentity = SearchSubentity.new
  end

  it "should be valid" do
    @search_subentity.should be_valid
  end
end
