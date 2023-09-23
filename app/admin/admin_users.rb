ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :sign_in_count, :current_sign_in_at, :created_at

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "current_sign_in_at", "encrypted_password", "id","sign_in_count","created_at", "updated_at"]
  end
  
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
