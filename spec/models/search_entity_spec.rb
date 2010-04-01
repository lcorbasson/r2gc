require File.dirname(__FILE__) + '/../spec_helper'

describe SearchEntity do
  before(:each) do
    @search_entity = SearchEntity.new
  end

  it "should be valid" do
    @search_entity.should be_valid
  end
end
