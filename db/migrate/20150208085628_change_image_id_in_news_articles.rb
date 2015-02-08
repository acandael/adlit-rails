class ChangeImageIdInNewsArticles < ActiveRecord::Migration
  def change
    change_column :news_articles, :image_id, :string
    change_column :news_articles, :document_id, :string
  end
end
