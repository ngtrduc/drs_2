# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@user = User.create! email: "admin@gmail.com", password: "12345678",
  password_confirmation: "12345678", is_admin: true
@user.create_profile

20.times do |n|
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  @user = User.create! email: email, password: password,
    password_confirmation: password
  @user.create_profile
end

Position.create! name: "Manager"
Position.create! name: "Employee"
Position.create! name: "Practice"

Division.create! name: "Laboratory"
Division.create! name: "KeangNam"

Skill.create! name: "Ruby"
Skill.create! name: "Java"
Skill.create! name: "PHP"

Progess.create! name: "Read Tutorial"
Progess.create! name: "Project 1"
Progess.create! name: "Project 2"

