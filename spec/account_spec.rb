require File.dirname(__FILE__) + '/spec_helper'

describe Account do
  before(:each) do
    @account = Factory(:account)
  end
  it "should keep associations set up in Fat Free CRM" do
    @account.respond_to?(:user).should be_true
    @account.respond_to?(:contacts).should be_true
    @account.respond_to?(:opportunities).should be_true
    @account.respond_to?(:tasks).should be_true
    @account.respond_to?(:activities).should be_true
  end
  it "should add new associations set up in Fat Free Issues plugin" do
    @account.respond_to?(:issue).should be_true
  end
end
