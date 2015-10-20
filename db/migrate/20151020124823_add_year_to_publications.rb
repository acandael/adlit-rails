class AddYearToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :year, :int
  end
end
