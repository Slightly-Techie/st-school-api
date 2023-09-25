class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.integer :contact_type
      t.string :phone
      t.string :email
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
