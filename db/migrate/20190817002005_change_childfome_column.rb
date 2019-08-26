class ChangeChildfomeColumn < ActiveRecord::Migration[5.2]
  def up
    add_column :child_forms, :parent_form_id, :text
    remove_column :child_forms, :parent_id, :text
  end

  def down
    remove_column :child_forms, :parent_form_id, :text
  end
end
