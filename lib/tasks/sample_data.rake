namespace :db do
  
  desc  "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User", email: "exampler@rdcars.com", password: "111222", password_confirmation: "111222")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@rdcars.com"
      password = "111222"
      User.create!(name: name, email: email, password: password, password_confirmation: password)
    end
  end 
  
  
end