Rails.application.routes.draw do

  resources :address

  resources :country do
    resources :state do
      resources :county
      resources :zip
    end
  end

  resources :county

  resources :customer do
    resources :address
    resources :email
    resources :person
    resources :phone
  end

  resources :email

  resources :note

  resources :person do
    resources :address
    resources :email
    resources :phone
  end

  resources :phone

  resources :salesperson

  resources :state do
    resources :county
    resources :zip
  end

  # resources with no nesting

  resources :zip

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  
end
