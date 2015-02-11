class NewsArticlesController < ApplicationController
  def index
    @news_articles = NewsArticle.recent(6)
  end

  def show
    @news_article = NewsArticle.find_by!(slug: params[:id])
  end
end

