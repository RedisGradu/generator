Rails.application.routes.draw do
  resources :users, except: [:new, :edit]
  resources :debts, except: [:new, :edit]
  resources :payments, except: [:new, :edit]
  resources :identities, except: [:new, :edit]
  resources :customers, except: [:new, :edit]

  get '/junks' => 'junks#add'


end