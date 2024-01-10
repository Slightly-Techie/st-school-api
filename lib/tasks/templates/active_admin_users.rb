ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :password, :password_confirmation,
  :phone_number, :stack_option, :completed

    index do
      selectable_column
      id_column
      column :email
      column :first_name
      column :last_name
      colum :phone_number

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
        stack_option = StackOption.find_by(name: params[:stack_option])
        ActiveRecord::Base.transaction do
            @user = User.create!(user_params.except(:stack_option).merge(stack_option: stack_option))
            Payment.create!(payment_params.merge(user: @user)) if @user.present? && @user.persisted?
        end

        if @user.save
          redirect_to admin_user_path(@user), notice: 'User was successfully created.'
        else
          render :new
        end
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                     :phone_number, :stack_option, :completed)
      end

      def payment_params
        params.require(:user).permit(:payment_method, :payment_type)
      end
    end

end
