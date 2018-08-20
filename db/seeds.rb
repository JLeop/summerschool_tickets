puts "DESTROYING"
Ticket.destroy_all
User.destroy_all

puts "CREATEING"
puts "users"

julian = User.new(email: "julian@rega-sense.ch", name: "julian", password: "testtest", ta: true)
julian.save!
tester = User.new(email: "student@test.com", name: "test", password: "testtest", ta: false)
tester.save!

puts "tickets"
Ticket.new(student: tester, ta: julian, question: "How to build a rails ticketing system for the HSG Summer School?").save!
Ticket.new(student: tester, ta: julian, question: "How to understand technology by Bryan and Flo").save!

puts "SEED COMPLETED"
