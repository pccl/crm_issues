# Include hook code here
#
#require 'ruby-debug'; debugger
if ActiveRecord::Base.connection.tables.include?('settings')
  if tabs = Setting.tabs
    unless tabs.map{|t| t[:url] }.any? { |url| url.match(/issues$/) }
      tabs << {:url => '/issues', :text => 'Issues', :active => false}
      Setting.tabs = tabs
    end
  end
end
