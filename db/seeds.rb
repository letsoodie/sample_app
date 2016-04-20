User.create!(name:  "administrator",
             email: "admin@admin.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)

User.create!(name:  "jeanjean",
             email: "jj@yopmail.com",
             password:              "password",
             password_confirmation: "password")

99.times do |n|
  name  = Faker::Name.name
  email = "test-#{n+1}@yopmail.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
