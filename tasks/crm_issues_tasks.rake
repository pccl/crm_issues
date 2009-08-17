namespace :issues do
  desc "Sync files from issues plugin."
  task :sync do
  system "rsync -ruv vendor/plugins/crm_issues/db/migrate db"
  system "rsync -ruv vendor/plugins/crm_issues/public ."
  end
end
