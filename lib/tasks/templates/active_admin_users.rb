ActiveAdmin.register User do
    permit_params :first_name, :last_name, :email, 
    :payment_type, :payment_method, :payment_status,
    :amount, :phone_number, :created_at, :updated_at,
    :stack_option, :completed
  
    index do
      selectable_column
      id_column
      column :email
      column :first_name
      column :last_name
      colum :phone_number
      column :payment_type
      column :payment_method
      column :payment_status
      column :amount
      column :created_at
      column :updated_at
      column :completed
      
      actions
    end
  
    filter :first_name
    filter :last_name
    filter :email
    filter :phone_number
    filter :stack_option
    filter :created_at
    filter :amount
    filter :updated_at
    filter :payment_type
    filter :payment_method
    filter :payment_status
  
    form do |f|
      f.inputs 'User Details' do
        f.input :first_name
        f.input :last_name
        f.input :email
        f.input :payment_type
        f.input :payment_method
        f.input :payment_status
        f.input :amount
        f.input :phone_number
        f.input :stack_option
        f.input :created_at
        f.input :updated_at
        f.input :completed
      end
      f.actions
    end
end
  