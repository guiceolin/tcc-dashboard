namespace :notifications do
  task :messages => :environment do
    User.all.each do |user|
      count = user.deliveries.unread.count
      puts Notifications.messages(user, count).deliver unless count <= 0
    end
  end
end
