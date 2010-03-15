require File.dirname(__FILE__) + '/../spec_helper'

describe EquipmentEquipment do
  before(:each) do
    @equipment_equipment = EquipmentEquipment.new
  end

  it "should be valid" do
    @equipment_equipment.should be_valid
  end
end
