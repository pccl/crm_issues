require "fat_free_crm"
FatFreeCRM::Plugin.register(:fat_free_issues, initializer) do
          name "Fat Free Issues"
        author "Drew Neil"
       version "0.1"
   description "Basic issue tracking"
  dependencies :simple_column_search, :uses_mysql_uuid, :uses_user_permissions
end

require 'fat_free_issues'
# Tip taken from here:
#   http://www.spacevatican.org/2008/5/28/reload-me-reload-me-not
# Without this line, development mode has a strange bug where associations
# between models in the plugin work fine for a single request after restarting
# the server, but fail to work on subsequent requests.
ActiveSupport::Dependencies.load_once_paths.delete(File.expand_path(File.dirname(__FILE__))+'/app/models')

# Include hook code here
#
if ActiveRecord::Base.connection.tables.include?('settings')
  if tabs = Setting.tabs
    unless tabs.map{|t| t[:url][:controller] }.any? { |url| url.match(/issues$/) unless url.blank? }
      tabs << {:url => { :controller => 'issues' }, :text => 'Issues', :active => false}
      Setting.tabs = tabs
    end
  end
end

# CommentsController has a COMMENTABLE array, listing the models which are commentable
# The array is frozen, so it can't be changed (although a new array can be assigned
# to the same constant)
# 
# TODO: find some way of adding "issue_id" to this array
#
# The following doesn't work in development mode:
#
#CommentsController::COMMENTABLE = CommentsController::COMMENTABLE + ["issue_id"]
#
# /home/an/src/fatfree_plugged/app/controllers/application_controller.rb:19: undefined local variable or method `application_helpers
