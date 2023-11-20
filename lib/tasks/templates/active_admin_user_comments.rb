ActiveAdmin.register UserComment do
    permit_params :body, :user_name, :user_email
  
    index do
      selectable_column
      id_column
      column :body
      column :user_name
      column :user_email
      column :created_at
      column :updated_at
      
      actions
    end
  
    filter :body
    filter :user_name
    filter :user_email
    filter :created_at
    filter :updated_at
    
  
    form do |f|
      f.inputs 'User Comment Details' do
        f.input :body
        f.input :user_name
        f.input :user_email
        f.input :created_at
        f.input :updated_at
      end
      f.actions
    end
end