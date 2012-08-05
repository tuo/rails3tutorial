namespace :db do
  
  desc  "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Tuo", email: "clarkhtse@gmail.com", password: "111222", password_confirmation: "111222")
    admin.toggle!(:admin)
    User.create!(name: "Fluxa", email: "jmfluxa@gmail.com", password: "111222", password_confirmation: "111222")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@rdcars.com"
      password = "111222"
      User.create!(name: name, email: email, password: password, password_confirmation: password)
    end
    users = User.all(limit:6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { | user | user.microposts.create!(content: content)}
    end
  end 
  
  desc "Reset the database and fill with data"
  task :update => ["db:reset", "db:migrate", "db:populate"] do
    puts "database is reset"
  end
  
  
  
end