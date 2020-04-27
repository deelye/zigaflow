Rails.application.routes.draw do
  root to: 'pages#home'

  resources :invoices, only: [:index, :new, :create, :edit, :show] do
    resources :items, only: [:new, :create, :destroy]
  end

  resources :products, only: [:index, :edit, :update]

end
