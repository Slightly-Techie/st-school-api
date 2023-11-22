namespace :active_admin_user_comments do
    desc 'Generate Active Admin resource for UserComment model'
    task :generate do
        copy_file 'lib/tasks/templates/active_admin_user_comments.rb', 'app/admin/user_comments.rb'
      generate_active_admin_resource
    end
  end
  
  def generate_active_admin_resource
    system('rails generate active_admin:resource UserComment')
    copy_file 'lib/tasks/templates/active_admin_user_comments.rb', 'app/admin/user_comments.rb'
  end