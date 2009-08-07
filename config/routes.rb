ActionController::Routing::Routes.draw do |map|
  map.resources :issues,      :has_many => :comments, :collection => { :search => :get, :auto_complete => :post, :options => :get, :redraw => :post }
end
