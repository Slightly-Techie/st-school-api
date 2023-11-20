class RenameCommentItemsToUserComments < ActiveRecord::Migration[7.0]
  def change
    rename_table :comment_items, :user_comments
  end
end
