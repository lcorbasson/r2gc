require File.dirname(__FILE__) + '/../spec_helper'

describe EquipmentType do
  before(:each) do
    @equipment_type = EquipmentType.new
  end

  it "should be valid" do
    @equipment_type.should be_valid
  end
end
