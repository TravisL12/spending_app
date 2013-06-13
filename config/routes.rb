SpendApp::Application.routes.draw do

  resources :users do
    resources :transactions
  end
  
  root :to => "users#index"

end
