class NewsArticlesController < ApplicationController
  def index
    if (category_selected?)
      @news_articles = NewsArticle.filter_by_category(params[:news_article][:news_category])
      @selected = params[:news_article].try(:[], :news_category)
    else
      @news_articles = NewsArticle.order(created_at: :desc).all
    end
  end

  def show
    @news_article = NewsArticle.find_by!(slug: params[:id])
  end

  def filter
    category = NewsCategory.find(params[:news_category_id])
    @news_articles = NewsArticle.where("news_category_id = ?", category.id)
    render :index
  end

  private
  
  def category_selected?
    params.has_key?(:news_article) && (params[:news_article][:news_category] != "")
  end
end
