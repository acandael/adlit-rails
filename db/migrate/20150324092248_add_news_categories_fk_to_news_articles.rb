class AddNewsCategoriesFkToNewsArticles < ActiveRecord::Migration
  def change
    add_column :news_articles, :news_category_id, :integer, index: true
  end
end
