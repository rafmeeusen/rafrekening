Coodle::Application.routes.draw do

  root :to => 'pages#home'
  get   '/new', :to => 'projects#new'
  get   '/:secret', :to => 'projects#show'

  match '/:secret/people/new', :to => 'people#new'
  post  '/:secret/people', :to => 'people#create'
  get   '/:secret/:name', :to => 'people#show'
  delete '/:secret/:name', :to => 'people#destroy'
  delete '/:secret/:name/expenses/:id', :to => 'expenses#destroy'
  post  '/:secret/:name/expenses', :to => 'expenses#create'  
  #match '/:secret/:name/edit', :to => 'people#edit'
  get   '/:secret/expenses/:expense_id', :to => 'peweights#create'  #with url params (query style)
  delete '/:secret/pew/:pew_id', :to => 'peweights#destroy' 

  get   '/:secret/:name/new', :to => 'expenses#new'
# resources :expenses
end
