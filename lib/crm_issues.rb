require "dispatcher"

Dispatcher.to_prepare do
  
  # Extend :account model to add :issues association.
  Account.send(:include, AccountIssueAssociations)

  # Make issues observable.
  ActivityObserver.instance.send :add_observer!, Issue

  # Add :issues plugin helpers.
  ActionView::Base.send(:include, IssuesHelper)

end

# Make the issues commentable.
CommentsController::COMMENTABLE = CommentsController::COMMENTABLE + %w(issue_id)
