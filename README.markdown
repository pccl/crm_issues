FatFreeIssues
=============

This plugin is under development, and is not yet ready for use!

The Issues plugin for Fat Free CRM is designed to work in sync with
a regular bug tracking application (such as Lighthouse, trac or 
Bugzilla). It allows you to create an issue, which is tied to an
account and may refer to a bug ticket from your external bug 
tracking application. When the ticket for a bug is closed, you can
search for issues which correspond to that bug, and mark the bug as
resolved. These issues are then queued for admin staff to contact 
each account, after which the issue itself can be marked as resolved.

Installation
============

Fat Free Issues can be installed by running:

    script/install plugin git://github.com/pccl/fat_free_issues.git

Then run the following commands:

    rake issues:sync
    rake db:migrate [RAILS_ENV=production]

Then restart your app server.


Alterations to Fat Free CRM code
================================

This plugin is not yet finished, but it is usable if you are willing to make modifications to the code of Fat Free CRM itself. This section details those changes.

**NOTE: the plugin won't work with `cache_classes = false`, which is the default in development mode.**


Add issue_id to CommentsController COMMENTABLE
----------------------------------------------

Open the `app/controllers/comments_controller.rb` file, look for the line:

    COMMENTABLE = %w(account_id campaign_id contact_id lead_id opportunity_id task_id).freeze

Add `issue_id` to this array, so that it looks like this:

    COMMENTABLE = %w(account_id campaign_id contact_id lead_id opportunity_id task_id issue_id).freeze

**TODO: modify this constant when the plugin is loaded.**


Load issues_helper in AccountsController
----------------------------------------

Open the file `app/controllers/accounts_controller.rb`, and insert the following code:

    helper :issues

It doesn't matter too much where you put this, but after the before/after_filters would be a sensible place.

**TODO: load the 'issues_helper' into the 'accounts_controller' when the plugin is loaded.**


Add issues to the Account landing page
--------------------------------------

Open the file `app/views/accounts/show.html.haml`. At the very end of the file, append the following lines of code:

    -#-----------------------------------------------------------------------------
    %br
    = inline :create_issue, new_issue_path, { :class => "subtitle_tools", :related => dom_id(@account) }
    .subtitle#create_issue_title Issues
    .remote#create_issue{ hidden }
    .list#issues
      = render :partial => "issues/issue", :collection => @account.issues

**TODO: load this snippet of view code using a callback hook.**
