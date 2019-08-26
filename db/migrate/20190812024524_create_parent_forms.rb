class CreateParentForms < ActiveRecord::Migration[5.2]
  def change
    create_table :parent_forms do |t|
      t.string :name
      t.string :user_name
      t.integer :user_id

      t.timestamps
    end
  end
end
