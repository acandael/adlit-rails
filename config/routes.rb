Rails.application.routes.draw do

  get 'admin', to: 'dashboard#index'

  namespace :admin do
    resources :news_articles
  end
end
