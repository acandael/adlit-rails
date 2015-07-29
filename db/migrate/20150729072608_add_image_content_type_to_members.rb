class AddImageContentTypeToMembers < ActiveRecord::Migration
  def change
    add_column :members, :image_content_type, :string
  end
end
