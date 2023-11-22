class RenameCommentsToCommentItems < ActiveRecord::Migration[7.0]
  def change
    rename_table :comments, :comment_items
  end
end
