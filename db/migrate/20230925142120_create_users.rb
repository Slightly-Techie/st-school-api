class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :role
      t.string :reset_password_token
      t.time :reset_password_sent_at

      t.timestamps
    end
  end
end
