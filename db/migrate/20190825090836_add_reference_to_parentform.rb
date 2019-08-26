class AddReferenceToParentform < ActiveRecord::Migration[5.2]
  def up
    add_reference :parent_forms, :user, foreign_key: true
  end

  def down
    remove_reference :parent_forms, :user, foreign_key: true
  end
end
