class CreateCertificates < ActiveRecord::Migration[7.0]
  def change
    create_table :certificates do |t|
      t.bigint :certificate_id
      t.datetime :completion_date
      t.string :cohort
      t.belongs_to :user

      t.timestamps
    end
  end
end
