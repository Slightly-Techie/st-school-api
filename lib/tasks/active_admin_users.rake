namespace :active_admin_users do
    desc 'Generate Active Admin resource for User model'
    task :generate do
        copy_file 'lib/tasks/templates/active_admin_users.rb', 'app/admin/users.rb'
      generate_active_admin_resource
    end
  end
  
  def generate_active_admin_resource
    system('rails generate active_admin:resource User')
    copy_file 'lib/tasks/templates/active_admin_users.rb', 'app/admin/users.rb'
  end
  

  
  