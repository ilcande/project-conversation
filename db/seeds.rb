require "faker"

# Clear existing records to avoid duplication
User.destroy_all
Project.destroy_all
Comment.destroy_all

# Create Users
users = Array.new(5) do |i|
  User.create!(
    name: Faker::Name.name,
    email: "user#{i + 1}@example.com",
    password: "password",
    password_confirmation: "password"
  )
end

# Create Projects with Random Statuses
projects = Array.new(10) do
  Project.create!(
    name: Faker::App.name,
    status: Project::STATUSES.sample,
    user: users.sample
  )
end

# Create Comments for Projects
projects.each do |project|
  rand(3..7).times do
    Comment.create!(
      content: Faker::Lorem.sentence(word_count: 10),
      user: users.sample,
      project: project
    )
  end
end

puts "✅ Seeded #{users.count} users, #{projects.count} projects, and some comments!"
