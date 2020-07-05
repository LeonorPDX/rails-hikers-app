Rails.application.routes.draw do
  resources :users, only: [:show]
  resources :trip_reports
  resources :check_ins
  resources :hikes
  resources :trailheads do
    resources :hikes, only: [:show, :new]
  end
  root 'static#home'
  
  devise_for :users, controllers: {registrations: "registrations", omniauth_callbacks: "callbacks"}
  devise_scope :user do 
      get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do 
    get 'logout', to: 'devise/sessions#destroy'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
