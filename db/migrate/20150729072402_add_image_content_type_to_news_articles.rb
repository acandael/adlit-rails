class AddImageContentTypeToNewsArticles < ActiveRecord::Migration
  def change
    add_column :news_articles, :image_content_type, :string
  end
end
