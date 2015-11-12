# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
b = User.create first_name:'Byron',
                last_name: "Jones",
                email:"Byron@yahoo.com",
                password: "12345678",
                password_confirmation:"12345678"

f = User.create first_name: 'Frederick',
                last_name: 'Lee',
                email:"Fred@yahoo.com",
                password: "12345678",
                password_confirmation:"12345678"
k = User.create first_name: 'Kia',
                last_name:'Jones',
                email:"Kia@yahoo.com",
                password:"12345678",
                password_confirmation:"12345678"


r = User.create first_name: 'Reggie ',
                last_name:'Bush',
                email:"Rbush@yahoo.com",
                password:"12345678",
                password_confirmation:"12345678"

j = User.create first_name: 'JJ',
                last_name:'Watt',
                email:"Jwatt@yahoo.com",
                password:"12345678",
                password_confirmation:"12345678"

t = User.create first_name: 'Taylor',
                last_name:'Swift',
                email:"Tswift@yahoo.com",
                password:"12345678",
                password_confirmation:"12345678"

5.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "user#{n}@tweet.com"
  password = "12345678"
  User.create!(first_name:  first_name, last_name: last_name, email: email, password: password,
   password_confirmation: password)
  end
users = User.all
[1..3].to_a.each do |n|

  user  = users.find(n)
  following = users[4..5]
  following.each { |followed| user.follow(followed) }
  following.each { |follower| follower.follow(user) }
end


  up = WorkoutType.create      name:"Upper Body",
                                image:"https://cdn3.iconfinder.com/data/icons/forall/1062/gym-128.png"

  lb = WorkoutType.create      name:"Lower Body",
                                image:"https://cdn3.iconfinder.com/data/icons/forall/1062/gym-128.png"

  cardio = WorkoutType.create  name:"Cardio",
                                image:"https://cdn3.iconfinder.com/data/icons/forall/1062/gym-128.png"

  abs = WorkoutType.create     name:"Abs",
                                image:"https://cdn3.iconfinder.com/data/icons/forall/1062/gym-128.png"

  other = WorkoutType.create     name:"other",
                                image:"https://cdn3.iconfinder.com/data/icons/forall/1062/gym-128.png"

 ab1  = Exercise.create         name:"Ab roller",
                                workout_type_id:4

ab2  = Exercise.create         name:"Situp",
                               workout_type_id:4

ab3  = Exercise.create          name:"ab crunch",
                                workout_type_id:4

upper1  = Exercise.create        name:"Barbell Bench Press",
                                workout_type_id:1

upper2  = Exercise.create        name:"Barbell incline",
                                 workout_type_id:1

upper3  = Exercise.create         name:"Pull ups",
                                  workout_type_id:1
