SpreadsheetUsa::Application.routes.draw do

  resources :users do
    resources :categories, :only => [:show]
    resources :transactions
  end
  
  root :to => "pages#index"
  
  post  '/login'  => 'session#login'
  get  '/logout' => 'session#logout'
  get '/categories/date_sort' => 'categories#date_sort', :as => 'category_date'
  
end
