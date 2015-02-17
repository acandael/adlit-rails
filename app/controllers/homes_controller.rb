class HomesController < ApplicationController
  def index
    @disable_footer = true
    @news_articles = NewsArticle.recent(6)
  end
end
