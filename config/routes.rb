Rails.application.routes.draw do
  root to: 'pages#home'

  resources :invoices, only: [:index, :new, :create, :show] do
    resources :items, only: [:new, :create, :destroy]
  end

end
