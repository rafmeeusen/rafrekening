Coodle::Application.routes.draw do

  root :to => 'pages#home'
  match '/new', :to => 'projects#new'
  match '/:secret', :to => 'projects#show'

  match '/:secret/people/new', :to => 'people#new'
  match '/:secret/people', :to => 'people#create'
  match '/:secret/:name', :to => 'people#show'
  match '/:secret/:name/expenses', :to => 'expenses#create'  
  match '/:secret/:name/edit', :to => 'people#edit'

  match '/:secret/:name/new', :to => 'expenses#new'
# resources :expenses
end
