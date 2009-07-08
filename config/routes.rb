ActionController::Routing::Routes.draw do |map|
  map.namespace(:admin) do |admin|
    admin.resources :slides, :member => { :move_up => :get, :move_down => :get }
  end
  map.resources :slides, :only => :index
end