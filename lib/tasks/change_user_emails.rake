namespace :user_emails do
  desc "Change user emails to lowercase"
  task downcase: :environment do
    User.all.each do |user|
      user.update(email: user.email.downcase)
    end

    puts "User emails changed to lowercase."
  end
end
