# FatFreeIssues

Account.class_eval do
  include AccountIssueAssociations
end

ActivityObserver.instance.send :add_observer!, Issue

# FIXME: This doesn't work! Help!
#ApplicationController.class_eval do
  #helper :issues
#end
