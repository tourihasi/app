class AddcolumnsSuccesUserNameToCollation < ActiveRecord::Migration[5.2]
  def up
    add_column :collations, :succes, :boolean
    add_column :collations, :user_name, :string
  end

  def down
    remove_column :collations, :succes, :boolean
    remove_column :collations, :user_name, :string
  end
end
