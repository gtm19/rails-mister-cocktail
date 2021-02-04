Rails.application.routes.draw do
  root to: 'pages#home'
  get "cocktails/random", to: "cocktails#random"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
