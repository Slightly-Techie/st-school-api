ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :password, :password_confirmation,
  :phone_number, :stack_option, :completed

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :phone_number
      row :stack_option
      row :completed
    end
    active_admin_comments_for(resource)
  end

    index do
      selectable_column
      id_column
      column :email
      column :first_name
      column :last_name
      column :phone_number
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
    filter :updated_at
    filter :completed

    form do |f|
      f.inputs 'User Details' do
        f.input :first_name
        f.input :last_name
        f.input :email
        f.input :password
        f.input :password_confirmation
        f.input :phone_number
        f.input :stack_option
        f.input :completed
      end
      f.actions
    end

    controller do
      def create
        @user = User.create!(user_params)

        if @user.save
          redirect_to admin_user_path(@user), notice: 'User was successfully created.'
        else
          render :new
        end
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                     :phone_number, :stack_option_id, :completed)
      end

      def payment_params
        params.require(:user).permit(:payment_method, :payment_type)
      end
    end
end
