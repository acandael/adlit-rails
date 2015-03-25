class NewsCategories < ActiveRecord::Migration
  def change
    create_table :news_categories do |t|
      t.string :name
    end
  end
end
