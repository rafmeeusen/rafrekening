Coodle::Application.routes.draw do

  root :to => 'pages#home'

  get    '/new',     :to => 'projects#new'
  post   '/new',     :to => 'projects#create'
  get    '/:secret', :to => 'projects#show'

  post   '/:secret/people',             :to => 'people#create'
  get    '/:secret/people/new',         :to => 'people#new'
  get    '/:secret/people/:name',       :to => 'people#show'
  delete '/:secret/people/:name',       :to => 'people#destroy'
  get    '/:secret/people/:name/edit',  :to => 'people#edit' 
  put    '/:secret/people/:name/edit',  :to => 'people#update'

  get    '/:secret/expenses/:name/new', :to => 'expenses#new'
  post   '/:secret/expenses/:name',     :to => 'expenses#create'  
  delete '/:secret/expenses/:id',       :to => 'expenses#destroy'

  get    '/:secret/expenses/:expense_id', :to => 'peweights#create'  #with url params (query style)
  delete '/:secret/pew/:pew_id', :to => 'peweights#destroy' 

# resources :expenses
end
