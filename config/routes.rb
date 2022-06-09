Rails.application.routes.draw do
  passwordless_for :users

  resources(:users)
  resources(:registrations, only: %i[new create])

  root "root#index"

  get "meals/search", to: "meals#search"
  get 'tags', to: "meals#tags"
  get 'tag/:id', to: "meals#tag"

  resources :meals do
    resources :cookings
  end
end
