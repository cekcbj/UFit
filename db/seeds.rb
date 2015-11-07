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
                password_confirmation:"12345678",
                profile_image:"http://www.icartoonwallpapers.com/wp-content/uploads/2015/09/Batman-Cartoon-8.jpg"

f = User.create first_name: 'Frederick',
                last_name: 'Lee',
                email:"Fred@yahoo.com",
                password: "12345678",
                password_confirmation:"12345678",
                profile_image:"http://desktopbackgrounds4u.com/wp-content/gallery/download-cartoon-images/cartoon-walt-disney-cartoons-mickey-mouse-purple-129601.jpg"
k = User.create first_name: 'Kia',
                last_name:'Jones',
                email:"Kia@yahoo.com",
                password:"12345678",
                password_confirmation:"12345678",
                profile_image:"https://consequenceofsound.files.wordpress.com/2014/04/drakesimpsons.jpg?w=807"

10.times do |n|
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
  following = users[4..10]
  following.each { |followed| user.follow(followed) }
  following.each { |follower| follower.follow(user) }
end
