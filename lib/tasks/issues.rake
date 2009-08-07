namespace :crm do
  namespace :demo do
    namespace :issues do
      desc "Load demo issues"
      task :load => :environment do
        require 'factory_girl'
        require 'faker'
        require File.expand_path(File.dirname(__FILE__) + "/../../../../../spec/factories.rb")
        require File.expand_path(File.dirname(__FILE__) + "/../../spec/factories.rb")
        10.times do |i|
          Factory(:issue)
        end
      end
    end
  end
end
