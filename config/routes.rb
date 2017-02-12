Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :documents
    match 'sign', :on => :collection, :via => [:get]
  end

  resources :clients do
    resources :documents
  end

  root 'pages#index'


  get '/success' => 'users#success'
end
