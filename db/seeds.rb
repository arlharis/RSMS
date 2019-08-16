User.create!(name:  "Lukman H",
             email: "lukman@rambutan.tech",
             password:              "lukman22",
             password_confirmation: "lukman22", admin: true)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end