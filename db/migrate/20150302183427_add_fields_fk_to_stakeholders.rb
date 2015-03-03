class AddFieldsFkToStakeholders < ActiveRecord::Migration
  def change
    add_foreign_key :stakeholders, :fields
    add_index :stakeholders, :field_id
  end
end
