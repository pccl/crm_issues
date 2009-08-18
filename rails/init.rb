require "fat_free_crm"
FatFreeCRM::Plugin.register(:crm_issues, initializer) do
          name "Fat Free Issues"
        author "Drew Neil"
       version "0.1"
   description "Basic issue tracking"
  dependencies :simple_column_search, :uses_mysql_uuid, :uses_user_permissions
end

require 'crm_issues'
# Tip taken from here:
#   http://www.spacevatican.org/2008/5/28/reload-me-reload-me-not
# Without this line, development mode has a strange bug where associations
# between models in the plugin work fine for a single request after restarting
# the server, but fail to work on subsequent requests.
ActiveSupport::Dependencies.load_once_paths.delete(File.expand_path(File.dirname(__FILE__))+'/app/models')

if ActiveRecord::Base.connection.tables.include?('settings')
  if tabs = Setting.tabs
    unless tabs.map{|t| t[:url][:controller] }.any? { |url| url.match(/issues$/) unless url.blank? }
      tabs << {:url => { :controller => 'issues' }, :text => 'Issues', :active => false}
      Setting.tabs = tabs
    end
  end
end

# Let the comments_controller know that issues are commentable
CommentsController::COMMENTABLE = CommentsController::COMMENTABLE + %w(issue_id)
