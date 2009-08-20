require "fat_free_crm"

FatFreeCRM::Plugin.register(:crm_issues, initializer) do
          name "Fat Free Issues"
        author "Drew Neil"
       version "0.1"
   description "Basic issue tracking"
  dependencies :haml, :simple_column_search, :uses_mysql_uuid, :uses_user_permissions
end

# Require the actual code after all plugin dependencies have been resoved.
require 'crm_issues'
require "show_account_hook"
