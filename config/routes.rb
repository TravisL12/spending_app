SpreadsheetUsa::Application.routes.draw do

  resources :users do
    resources :categories, :only => [:show]
    resources :transactions
  end
  
  root :to => "pages#index"
  
  post  '/login'  => 'session#login'
  get  '/logout' => 'session#logout'
  
end
