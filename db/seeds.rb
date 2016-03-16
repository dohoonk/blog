# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do
 Post.create  title: Faker::Book.title,
               body: Faker::Hipster.paragraph
 end

 20.times do
  Comment.create body: Faker::Hipster.paragraph
 end

 20.times do
  Category.create title: Faker::Book.title
 end
 
 20.times do
  Contact.create email: Faker::Internet.email,
                 name: Faker::Name.name,
                 subject: Faker::Hipster.sentence,
                 message: Faker::Hipster.paragraph
 end
