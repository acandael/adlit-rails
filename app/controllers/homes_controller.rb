class HomesController < ApplicationController
  def index
    @subscription = Subscription.new
    @disable_footer = true
    @news_articles = NewsArticle.recent(6)
  end
end
