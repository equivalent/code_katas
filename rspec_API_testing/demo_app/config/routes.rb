Rails.application.routes.draw do
  resources :articles
  namespace :v2 do
    resources :articles
  end
end
