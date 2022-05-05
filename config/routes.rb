Rails.application.routes.draw do
  root "meals#index"

  resources :meals do
    resources :cookings
  end
end
