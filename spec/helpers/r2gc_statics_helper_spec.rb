require File.dirname(__FILE__) + '/../spec_helper'

describe R2gcStaticsHelper do
  
  #Delete this example and add some real ones or delete this file
  it "should include the R2gcStaticsHelper" do
    included_modules = self.metaclass.send :included_modules
    included_modules.should include(R2gcStaticsHelper)
  end
  
end
