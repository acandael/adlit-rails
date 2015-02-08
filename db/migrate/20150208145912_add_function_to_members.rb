class AddFunctionToMembers < ActiveRecord::Migration
  def change
    add_column :members, :function, :string
  end
end
