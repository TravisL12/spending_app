SpreadsheetUsa::Application.routes.draw do

  resources :users do
    resources :categories, :only => [:show]
    resources :transactions do
    	collection { post :import }
    end
  end

  root :to => "pages#index"
  post '/login'  => 'sessions#login'
  get  '/logout' => 'sessions#logout'
  get  '/categories/date_sort' => 'categories#date_sort', :as => 'category_date'
  get '/auth/:provider/callback', :to => 'authentications#create'

end
