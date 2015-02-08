class CreateNewsArticles < ActiveRecord::Migration
  def change
    create_table :news_articles do |t|
      t.string :title
      t.string :body
      t.integer :image_id
      t.integer :document_id
      t.string :link

      t.timestamps
    end
  end
end
