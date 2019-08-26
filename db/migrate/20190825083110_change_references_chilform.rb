class ChangeReferencesChilform < ActiveRecord::Migration[5.2]
  def up
    remove_column :child_forms, :user_id, :integer
    remove_column :child_forms, :user_name, :string
    remove_column :child_forms, :parent_form_id, :text
    add_reference :child_forms, :user, foreign_key: true
    add_reference :child_forms, :parent_form, foreign_key: true
  end

  def down
    remove_reference :child_forms, :user, foreign_key: true
    remove_reference :child_forms, :parent_form, foreign_key: true
    add_column :child_forms, :user_id, :integer
    add_column :child_forms, :user_name, :string
    add_column :child_forms, :parent_form_id, :text
  end
end
