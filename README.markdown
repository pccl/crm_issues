CRM Issues
==========

**This plugin is under development, and is not yet ready for use!**

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

The Issues plugin can be installed by running:

    script/install plugin git://github.com/pccl/crm_issues.git

Then run the following commands:

    rake issues:sync
    rake db:migrate [RAILS_ENV=production]

Then restart your app server.


**NOTE: the plugin won't work with `cache_classes = false`, which is the default in development mode.**

