class AddDocumentFileNameToNewsArticles < ActiveRecord::Migration
  def change
    add_column :news_articles, :document_filename, :string
  end
end
