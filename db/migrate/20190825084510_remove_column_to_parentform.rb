class RemoveColumnToParentform < ActiveRecord::Migration[5.2]
  def up
    remove_column :parent_forms, :user_id, :integer
    remove_column :parent_forms, :user_name, :string
  end

  def down
    add_column :parent_forms, :user_id, :integer
    add_column :parent_forms, :user_name, :string
  end
end
