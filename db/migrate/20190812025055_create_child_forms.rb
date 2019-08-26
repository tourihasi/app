class CreateChildForms < ActiveRecord::Migration[5.2]
  def change
    create_table :child_forms do |t|
      t.string :name
      t.string :user_name
      t.string :revision
      t.string :reson
      t.integer :user_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
