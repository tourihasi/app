class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :revision
      t.string :user_name
      t.string :reson

      t.timestamps
    end
  end
end
