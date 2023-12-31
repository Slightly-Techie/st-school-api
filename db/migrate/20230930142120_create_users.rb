class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :payment_type
      t.string :payment_method
      t.string :payment_status
      t.float :amount
      t.string :phone_number
      t.string :auth_token
      t.string :reset_password_token
      t.time :reset_password_sent_at

      t.belongs_to :stack_option, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
