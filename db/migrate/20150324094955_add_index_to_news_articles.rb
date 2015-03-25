class AddIndexToNewsArticles < ActiveRecord::Migration
  def change
    add_index :news_articles, :news_category_id
  end
end
