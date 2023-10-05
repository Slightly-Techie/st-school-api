class CreateStackOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :stack_options do |t|
      t.string :name
      t.belongs_to :stack, null: false, foreign_key: true
      
      

      t.timestamps
    end
  end
end
