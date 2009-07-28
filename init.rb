# Include hook code here
#
tabs = Setting.tabs
unless tabs.map{|t| t[:url] }.any? { |url| url.match(/issues$/) }
  tabs << {:url => '/issues', :text => 'Issues', :active => false}
  Setting.tabs = tabs
end
