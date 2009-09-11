require "dispatcher"

Dispatcher.to_prepare do
  
  # Extend :account model to add :issues association.
  Account.send(:include, AccountIssueAssociations)

  # Make issues observable. <--- This appear to work only in production mode
  ActivityObserver.instance.send :add_observer!, Issue

  # Add :issues plugin helpers.
  ActionView::Base.send(:include, IssuesHelper)

end

# NOTE: for some misterious reason the following doesn't work within Dispatcher block,
# so the :tabs override works in production mode only. (Or in development mode with 
# config.cache_classes = true.)

# Make the issues commentable.
CommentsController::COMMENTABLE = CommentsController::COMMENTABLE + %w(issue_id)
