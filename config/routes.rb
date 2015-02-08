Rails.application.routes.draw do
  get 'news', to: 'news_articles#index'
  get 'news/article/:id', to: 'news_articles#show', as: 'news_article'
  get 'signin', to: 'sessions#new' 
  get 'admin', to: 'dashboard#index'

  resource :session

  namespace :admin do
    resources :news_articles
  end
end
