# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "users"

julian = User.new(email: "julian@rega-sense.ch", name: "julian", password: "testtest", ta: true)
julian.save!
tester = User.new(email: "student@test.com", name: "test", password: "testtest", ta: false)
tester.save!

puts "tickets"
Ticket.new(student: tester, ta: julian, question: "how to build a rails ticketing system for the HSG Summer School?").save!

puts "seed completed"
