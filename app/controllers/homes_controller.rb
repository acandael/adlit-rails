class HomesController < ApplicationController
  def index
    @disable_footer = true
    @news_articles = NewsArticle.all
  end
end
