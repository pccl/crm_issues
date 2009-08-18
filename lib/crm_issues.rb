# crm_issues.rb

# Extend :account model to add :issues association.
Account.send(:include, AccountIssueAssociations)

# Let the activity_observer know about issues.
ActivityObserver.instance.send :add_observer!, Issue

# Add :issues plugin helpers
ActionView::Base.send(:include, IssuesHelper)
