Rails.application.routes.draw do
  root to: 'pages#home'

  resources :invoices do
    resources :items
  end

end
