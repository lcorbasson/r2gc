require File.dirname(__FILE__) + '/../spec_helper'

describe SubscriptionNewsletter do
  before(:each) do
    @subscription_newsletter = SubscriptionNewsletter.new
  end

  it "should be valid" do
    @subscription_newsletter.should be_valid
  end
end
