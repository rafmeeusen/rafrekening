Coodle::Application.routes.draw do

  root :to => 'pages#home'
  match '/new', :to => 'projects#new'
  match '/:secret', :to => 'projects#show'

  match '/:secret/people/new', :to => 'people#new'
  match '/:secret/people', :to => 'people#create'
end
