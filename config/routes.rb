Rails.application.routes.draw do
  root "homes#index"
  get 'news', to: 'news_articles#index'
  get 'nieuws/:id', to: 'news_articles#show', as: 'news_article'
  get 'filter_news/:news_category_id', to: 'news_articles#filter', as: 'filter_news'
  get 'team', to: 'members#index'
  get 'team/:id', to: 'members#show', as: 'member'
  get 'output', to: 'publications#index'
  get 'output/:category', to: 'publications#sort', as: 'publications'
  get 'project', to: 'pages#project'
  get 'doelstellingen', to: 'pages#doelstellingen'
  get 'contact', to: 'pages#contact'
  get 'english', to: 'pages#english'
  get 'stakeholders', to: 'stakeholders#index'
  get 'signin', to: 'sessions#new' 
  get 'admin', to: 'dashboard#index'

  resource :session

  namespace :admin do
    resources :news_articles
    resources :members do
      collection { post :sort }
    end
    resources :publications
    resources :stakeholders
  end
end
