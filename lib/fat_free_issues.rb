# FatFreeIssues

Account.class_eval do
  include AccountIssueAssociations
end

ActivityObserver.instance.send :add_observer!, Issue
