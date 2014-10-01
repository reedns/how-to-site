Rails.application.routes.draw do
  root 'guides#index'

  resources :guides do
    resources :steps
  end
end
