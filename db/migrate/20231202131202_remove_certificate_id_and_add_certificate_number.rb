class RemoveCertificateIdAndAddCertificateNumber < ActiveRecord::Migration[7.0]
  def change
    remove_column :certificates, :certificate_id, :bigint
    add_column :certificates, :certificate_number, :string
  end
end
