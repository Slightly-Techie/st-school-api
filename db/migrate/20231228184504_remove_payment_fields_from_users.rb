class RemovePaymentFieldsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :amount, :float
    remove_column :users, :payment_status, :string
    remove_column :users, :payment_method, :string
    remove_column :users, :payment_type, :string
  end
end
