class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.string :user_name
      t.string :user_email

      t.timestamps
    end
  end
end
