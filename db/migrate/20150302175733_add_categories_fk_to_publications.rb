class AddCategoriesFkToPublications < ActiveRecord::Migration
  def change
    add_foreign_key :publications, :categories
    add_index :publications, :category_id
  end
end
