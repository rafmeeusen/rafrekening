Coodle::Application.routes.draw do

  root :to => 'pages#home'

  get    '/new',     :to => 'projects#new'
  post   '/new',     :to => 'projects#create'
  get    '/:secret', :to => 'projects#show'

  post   '/:secret/people',            :to => 'people#create'
  get    '/:secret/people/new',        :to => 'people#new'
  get    '/:secret/people/:name',      :to => 'people#show'
  delete '/:secret/people/:name',      :to => 'people#destroy'
  get    '/:secret/people/:name/edit', :to => 'people#edit' 
  put    '/:secret/people/:name/edit', :to => 'people#update'

  delete '/:secret/:name/expenses/:id', :to => 'expenses#destroy'
  post   '/:secret/:name/expenses', :to => 'expenses#create'  
  get    '/:secret/expenses/:expense_id', :to => 'peweights#create'  #with url params (query style)
  delete '/:secret/pew/:pew_id', :to => 'peweights#destroy' 

  get    '/:secret/:name/new', :to => 'expenses#new'
# resources :expenses
end
