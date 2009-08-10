namespace :issues do
  desc "Sync files from issues plugin."
  task :sync do
  system "rsync -ruv vendor/plugins/fat_free_issues/db/migrate db"
  system "rsync -ruv vendor/plugins/fat_free_issues/public ."
  end
end
