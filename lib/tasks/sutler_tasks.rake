namespace :sutler do

  desc "Created an admin user for Sutler"
  task :user, [:email, :password] => :environment do |t, args|
    sutler_user = Sutler::User.new do |user|
      user.email = args[:email]
      user.password = args[:password]
      user.password_confirmation = args[:password]
    end
    if sutler_user.save
      puts "Go to http://yourdomain.com#{Rails.application.routes.url_helpers.sutler_path} to login"
    else
      puts sutler_user.errors.full_messages.join(', ')
    end
  end

end
