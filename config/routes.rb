SpendApp::Application.routes.draw do

  resources :users do
    resources :transactions
  end
  
  root :to => "users#index"
  
  get  '/user/login'  => 'users#login'
  get  '/user/logout' => 'users#logout'
  get  '/profile'     => 'users#show'
  post '/user/login'  => 'users#authenticate'

end
