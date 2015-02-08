class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :organization
      t.text :address
      t.string :affiliation
      t.string :link
      t.string :image_id
    end
  end
end
