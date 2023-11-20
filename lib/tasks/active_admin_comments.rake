namespace :active_admin_comments do
    desc 'Generate Active Admin resource for Comment model'
    task :generate do
        copy_file 'lib/tasks/templates/active_admin_comments.rb', 'app/admin/comments.rb'
      generate_active_admin_resource
    end
  end
  
  def generate_active_admin_resource
    system('rails generate active_admin:resource Comment')
    copy_file 'lib/tasks/templates/active_admin_comments.rb', 'app/admin/comments.rb'
  end