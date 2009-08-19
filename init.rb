require "fat_free_crm"
require 'crm_issues'

FatFreeCRM::Plugin.register(:crm_issues, initializer) do
          name "Fat Free Issues"
        author "Drew Neil"
       version "0.1"
   description "Basic issue tracking"
  dependencies :simple_column_search, :uses_mysql_uuid, :uses_user_permissions
end

