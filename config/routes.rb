ActionController::Routing::Routes.draw do |map|
  map.namespace(:admin) do |admin|
    admin.resources :slides
  end
  map.resources :slides, :only => :index
end