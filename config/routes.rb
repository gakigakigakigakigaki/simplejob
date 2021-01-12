Rails.application.routes.draw do
  root to: "jobs#index"
  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  
  resources :jobs do
    post 'add' => 'likes#create'
  delete '/add' => 'likes#destroy' 
  resources :messages
  end
  resources :users
  resources :companies 
end
