Rails.application.routes.draw do
  root "meals#index"

  get "meals/search", to: "meals#search"

  resources :meals do
    resources :cookings
  end
end
