class CommentModelAddColumnMessageModelAsosiate < ActiveRecord::Migration[5.2]
  def up
    add_column :comments, :content, :string
    add_column :comments, :user_name, :string
    add_reference :comments, :user, null: false, index: true
    add_reference :comments, :message, null: false, index: true
  end

  def down
    remove_column :comments, :content, :string
    renove_column :comments, :user_name, :string
    remove_reference :comments, :user, null: false, index: true
    remove_reference :comments, :message, null: false, index: true
  end
end
