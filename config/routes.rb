ActionController::Routing::Routes.draw do |map|
  map.namespace(:admin) do |admin|
    admin.resources :slide_shows do |slide_show| 
      slide_show.resources :slides, :member => { :move_up => :get, :move_down => :get }
    end
    admin.resources :slides, :member => { :move_up => :get, :move_down => :get }
  end
  map.resources :slides, :only => :index
  map.resources :slide_shows, :has_many => :slides
end