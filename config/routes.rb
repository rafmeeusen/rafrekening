Coodle::Application.routes.draw do

  root :to => 'pages#home'
  match '/new', :to => 'projects#new'
  match '/:secret', :to => 'projects#show'

end
