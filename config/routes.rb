Coodle::Application.routes.draw do

  root :to => 'pages#home'
  match '/new', :to => 'projects#new'
  match '/:secret', :to => 'projects#show'

  match '/:secret/people/new', :to => 'people#new'
  match '/:secret/people', :to => 'people#create'
  get   '/:secret/:name', :to => 'people#show'
  delete '/:secret/:name', :to => 'people#destroy'
  delete '/:secret/:name/expenses/:id', :to => 'expenses#destroy'
  match '/:secret/:name/expenses', :to => 'expenses#create'  
  match '/:secret/:name/edit', :to => 'people#edit'

  match '/:secret/:name/new', :to => 'expenses#new'
# resources :expenses
end
