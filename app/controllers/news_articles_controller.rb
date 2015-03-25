class NewsArticlesController < ApplicationController
  def index
    @news_articles = NewsArticle.recent(6)
  end

  def show
    @news_article = NewsArticle.find_by!(slug: params[:id])
  end

  def filter
    category = NewsCategory.find(params[:news_category_id])
    @news_articles = NewsArticle.where("news_category_id = ?", category.id)
    render :index
  end
end
