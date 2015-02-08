class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.string :link
      t.string :document_id
      t.integer :category_id

      t.timestamps
    end
  end
end
