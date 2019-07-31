class MessageModelAddColumnCommentModelAsosiate < ActiveRecord::Migration[5.2]
  def up
    add_column :messages, :title, :string
    add_column :messages, :body, :text
    add_reference :messages, :user, null: false, index: true
  end

  def down
    remove_column :messages, :title, :string
    renove_column :messages, :body, :text
    remove_reference :messages, :user, null: false, index: true
  end

end
