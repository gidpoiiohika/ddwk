Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: { registrations: "users/registrations" }

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  resources :adverts, only: [:show, :index]
  resources :puppies, only: [:show, :index]
  resources :dogs, only: [:show, :index]

  namespace :admin do
    root "adverts#index"
    resources :adverts
    resources :puppies
    resources :dogs
  end
end
