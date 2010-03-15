require File.dirname(__FILE__) + '/../spec_helper'

describe CorrespondentsEquipments do
  before(:each) do
    @correspondents_equipments = CorrespondentsEquipments.new
  end

  it "should be valid" do
    @correspondents_equipments.should be_valid
  end
end
