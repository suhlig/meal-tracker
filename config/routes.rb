Rails.application.routes.draw do
  passwordless_for :users

  resources(:users)
  resources(:registrations, only: %i[new create])

  root "root#index"

  resources :meals do
    get :search, on: :collection
    get :autocomplete, on: :collection
    resources :cookings
  end

  resources :cookings
  resources :tags
end
