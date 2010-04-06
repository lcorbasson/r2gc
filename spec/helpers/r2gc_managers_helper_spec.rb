require File.dirname(__FILE__) + '/../spec_helper'

describe R2gcManagersHelper do
  
  #Delete this example and add some real ones or delete this file
  it "should include the R2gcManagersHelper" do
    included_modules = self.metaclass.send :included_modules
    included_modules.should include(R2gcManagersHelper)
  end
  
end
