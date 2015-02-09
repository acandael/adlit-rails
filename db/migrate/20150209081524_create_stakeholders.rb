class CreateStakeholders < ActiveRecord::Migration
  def change
    create_table :stakeholders do |t|
      t.string :name
      t.string :link
      t.integer :field_id
    end
  end
end
