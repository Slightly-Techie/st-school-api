class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :amount_paid
      t.string :payment_method
      t.string :payment_type
      t.belongs_to :user

      t.timestamps
    end
  end
end
